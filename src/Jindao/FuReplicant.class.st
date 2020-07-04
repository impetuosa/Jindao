"
project :=  JinAccessApplication default open: 'D:\Users\Santiago.BRAGAGNOLO\Documents\PhD\Resources\11.50.00.02\Produit\caccueil.accdb' asFileReference .
newProject := JinAccessApplication default createNewProject: 'replica.adp' asFileReference.
FuReplicant replicateTables: project into: newProject.

JinBodyObject   allInstances .
project :=  JinAccessApplication default open: 'D:\Users\Santiago.BRAGAGNOLO\Documents\norwind\Northwind.accdb' asFileReference.

'Southwind.accdb' asFileReference ensureDelete.
newProject := JinAccessApplication default createNewProject: 'Southwind.accdb' asFileReference.
FuReplicant replicate: project into: newProject.
"
Class {
	#name : #FuReplicant,
	#superclass : #JinStackVisitor,
	#instVars : [
		'source',
		'target',
		'renames',
		'failures',
		'successes',
		'statistics'
	],
	#classInstVars : [
		'data'
	],
	#category : #'Jindao-FuZhi'
}

{ #category : #'as yet unclassified' }
FuReplicant class >> data [
	^ data
]

{ #category : #'as yet unclassified' }
FuReplicant class >> data: aCollection [
	data := aCollection
]

{ #category : #'as yet unclassified' }
FuReplicant class >> replicate: aJinAccessProject into: aJinAccessProject2 [
	^ self new
		source: aJinAccessProject;
		target: aJinAccessProject2;
		replicate;
		yourself
]

{ #category : #'as yet unclassified' }
FuReplicant class >> replicateForms: source into: target [ 
	^ self new
		source: source;
		target: target;
		replicateForms
]

{ #category : #'as yet unclassified' }
FuReplicant class >> replicateRelations: source into: target [ 
	^ self new
		source: source;
		target: target;
		replicateRelations
]

{ #category : #'as yet unclassified' }
FuReplicant class >> replicateTables: source into: target [
	^ self new
		source: source;
		target: target;
		replicateTables
]

{ #category : #'as yet unclassified' }
FuReplicant class >> source: aJinAccessProject target: aJinAccessProject2 [
	^ self new
		source: aJinAccessProject;
		target: aJinAccessProject2;
		yourself
]

{ #category : #'as yet unclassified' }
FuReplicant >> aggregation [
	| comp |
	comp := statistics values collect: [ :d | d failures * 100 ].
	^ {comp max.
	comp min.
	(comp collect: [ :v | v roundUpTo: 1 ]) mode asFloat.
	(comp collect: [ :v | v roundUpTo: 1 ]) median asFloat.
	comp averageOrZero.
	comp stdevOrZero}
]

{ #category : #'as yet unclassified' }
FuReplicant >> aggregationPerType [
^ self statisticsPerType associations
		collect: [ :ass | 
			| comp |
			comp := ass value collect: [: d | d failures * 100 ].
			{
			ass key.
			comp max.
			comp min.
			((comp collect: [ :v | v roundUpTo: 1 ]) mode) asFloat.
			((comp collect: [ :v | v roundUpTo: 1 ]) median) asFloat.
			comp averageOrZero.
			comp stdevOrZero} ]
]

{ #category : #'visit-first-objects' }
FuReplicant >> applyRenames [
	target reopen.
	renames do: [ :r | r applyOn: target ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> create: c in: form [
	[ | val |
	val := c createIn: form.
	self registerStatisticChild: c.
	^ val ]
		on: Win32Error
		do: [ :e | 
			self registerFailStatisticChild: c error: e messageText.
			^ nil ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> create: c inReport: report [
	[ | val |
	val := report
		createControl: c name
		type: c controlTypeNumber
		section: c section.
	self registerStatisticChild: c.
	^ val ]
		on: Win32Error
		do: [ :e | 
			self registerFailStatisticChild: c error: e messageText.
			^ nil ]
]

{ #category : #statistics }
FuReplicant >> createdFirstCitizen [
	^ (((successes groupedBy: #first) at: #ReplicateObject)
		groupedBy: [ :a | a second className ]) associations
		collect: [ :a | a key -> a value size ]
]

{ #category : #statistics }
FuReplicant >> failedFirstCitizen [
	^ (((failures groupedBy: #first) at: #ReplicateObject)
		groupedBy: [ :a | a third className ]) associations
		collect: [ :a | a key -> a value size ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> infuseProperties2: anAccessObject into: anOtherAccessObject [
anOtherAccessObject ifNil: [ ^ self ].
	anAccessObject isCustomControl
		ifTrue: [ ^ self infuseProperties: anAccessObject into: anOtherAccessObject ].
	anAccessObject propertiesToInfuse
		do:
			[ :p | self set: p from: anAccessObject handle to: anOtherAccessObject handle context: anAccessObject  ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> infuseProperties: aJinObjectSource into: aJinObjectTarget [
	| table  |
	aJinObjectTarget ifNil: [ ^ self ].
	table := Dictionary new.
	aJinObjectSource properties
		do: [ :p | 
			| name value |
			[ name := p name.
			value := p value ]
				on: Error
				do: [ :e | 
					((e isKindOf: KeyNotFound) or: [ e isError0x80020009 ])
						ifTrue: [ value := nil ]
						ifFalse: [ e signal ] ].
			name ifNotNil: [ table at: name put: value ] ].
	aJinObjectTarget properties
		collect: [ :p | 
			[ (table at: p name) ifNotNil: [ :v | p value: v ] ]
				on: Error
				do: [ :e | 
					((e isKindOf: KeyNotFound) or: [ e isError0x80020009 ])
						ifTrue: [ nil ]
						ifFalse: [ e signal ] ] ]
]

{ #category : #initialization }
FuReplicant >> initialize [
	super initialize.
	renames := OrderedCollection new.
	failures := OrderedCollection new.
	successes := OrderedCollection new.
	statistics := Dictionary new. 
]

{ #category : #'as yet unclassified' }
FuReplicant >> name [
	^ source fileName readStream upTo: $.
]

{ #category : #'as yet unclassified' }
FuReplicant >> overview [
	^ statistics values
		collect: [ :c | 
			{self name.
			c type asString copyReplaceAll: 'Jin' with: ''.
			c name.
			c failures * 100 }]
]

{ #category : #'as yet unclassified' }
FuReplicant >> points [
	^ (statistics values collect: #points) average
]

{ #category : #'as yet unclassified' }
FuReplicant >> pointsPerType [
	^ (statistics values groupedBy: #type) associations
		collect: [ :o | o key -> (o value collect: #points) average asFloat ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> printOn: aStream [
	aStream nextPutAll: 'Replicant[P:'.
	aStream
		nextPutAll: source fileName;
		nextPutAll: ']'
]

{ #category : #'as yet unclassified' }
FuReplicant >> registerFailStatistic: anElement error: e [ 
	statistics
		at: ([anElement name] ifError:[anElement class name, anElement handle getTypeInfo guid ])
		put:
			(FuObject new
				type: anElement class name;
				name: ([anElement name] ifError:[anElement class name, anElement handle getTypeInfo guid ]);
				success: false;
				errorText: e messageText;
				yourself)
]

{ #category : #'as yet unclassified' }
FuReplicant >> registerFailStatisticChild: aControl error: errorText [
	(statistics at: aControl scopingName)
		addChild:
			(FuObject new
				type: aControl class name;
				name: aControl name;
				success: false;
				errorText: errorText;
				yourself)
]

{ #category : #'as yet unclassified' }
FuReplicant >> registerStatistic: anElement [
	statistics
		at: ([anElement name] ifError:[anElement class name, anElement handle getTypeInfo guid ])
		ifAbsentPut:[
			(FuObject new
				type: anElement class name;
				name:([anElement name] ifError:[anElement class name, anElement handle getTypeInfo guid ]);
				success: true;
				yourself)]
]

{ #category : #'as yet unclassified' }
FuReplicant >> registerStatisticChild: aControl [
	(statistics at: aControl scopingName)
		addChild:
			(FuObject new 
				type: aControl class name;
				name: aControl name;
				success: true;
				yourself)
]

{ #category : #'as yet unclassified' }
FuReplicant >> registerStatisticProperty: aName childOf: aModelObject [
	aModelObject isControl
		ifFalse: [ (statistics at: aModelObject name)
				addProperty:
					(FuObject new
						type: aModelObject class name;
						name: aName;
						success: true;
						yourself) ]
		ifTrue: [ ((statistics at: aModelObject scopingName) children
				detect: [ :f | f name = aModelObject name ])
				addProperty:
					(FuObject new
						type: aModelObject class name;
						name: aName;
						success: true;
						yourself) ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> registerStatisticPropertyFailedToRead: aName childOf: aModelObject [
	aModelObject isControl
		ifFalse: [ (statistics at: aModelObject name)
				addProperty:
					(FuObject new
						type: aModelObject class name;
						name: aName;
						success: false;
						errorText: 'Failed to read from source application' yourself) ]
		ifTrue: [ ((statistics at: aModelObject scopingName) children
				detect: [ :f | f name = aModelObject name ])
				addProperty:
					(FuObject new
						type: aModelObject class name;
						name: aName;
						success: false;
						errorText: 'Failed to read from source application' yourself) ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> registerStatisticPropertyFailedToWrite: aName childOf: aModelObject [
	aModelObject isControl
		ifFalse: [ (statistics at: aModelObject name)
				addProperty:
					(FuObject new
						type: aModelObject class name;
						name: aName;
						success: false;
						errorText: 'Failed to write to target application' yourself) ]
		ifTrue: [ ((statistics at: aModelObject scopingName) children
				detect: [ :f | f name = aModelObject name ])
				addProperty:
					(FuObject new
						type: aModelObject class name;
						name: aName;
						success: false;
						errorText: 'Failed to write to target application' yourself) ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> registerStatisticPropertyReadOnly: aName childOf: aModelObject [
	aModelObject isControl
		ifFalse: [ (statistics at: aModelObject name)
				addProperty:
					(FuObject new
						type: aModelObject class name;
						name: aName;
						success: #readOnly;
						errorText: 'Readonly property' yourself) ]
		ifTrue: [ ((statistics at: aModelObject scopingName) children 
				detect: [ :f | f name = aModelObject name ])
				addProperty:
					(FuObject new
						type: aModelObject class name;
						name: aName;
						success: #readOnly;
						errorText: 'Readonly property' yourself) ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicate [
	source acceptVisitor: self
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateForm: aForm [
	| form tuples |
	form := target createForm.
	aForm hasHeaderFooter
		ifTrue: [ form installHeaderFooter ].
	aForm hasPageHeaderFooter
		ifTrue: [ form installPageHeaderFooter ]
		ifFalse: [ form ensureItHasNonPageHeaderFooter ].
	self infuseProperties2: aForm body into: form body.
	self sectionsFrom: aForm into: form.
	tuples := Dictionary new.
	aForm controls
		do: [ :c | 
			c isEmptyCell
				ifFalse:
					[ "				https://docs.microsoft.com/en-us/office/vba/api/Access.EmptyCell
				An EmptyCell object is created when a control layout contains an empty cell. You cannot explicitly create or delete an EmptyCell object.
				" tuples at: c put: (self create:c in: form) ] ].
	form module code insertLines: aForm module code content.
	tuples
		keysAndValuesDo: [ :cs :ct | self infuseProperties2: cs into: ct ].
	self replicateModuleForm: aForm module into: form.
	form save.
	form close.
	renames
		add:
			(FuRename
				object: form
				to: aForm name
				hasModule: aForm hasModule
				moduleContents: aForm module code contents).
	^ form
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateForms [
	self visitCollection: source forms
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateGroupLevel: aGroup into: aReport [
	| groupLevel |
	groupLevel := aReport
		addGroupLevel: aGroup controlSource
		header: aGroup groupHeader
		footer: aGroup groupFooter.
	groupLevel groupOn: aGroup groupOn.
	groupLevel groupInterval: aGroup groupInterval.
	groupLevel keepTogether: aGroup keepTogether.
	groupLevel sortOrder: aGroup sortOrder
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateModule: aJinModule [
	| newModule  export |
	export :=  aJinModule export.
	newModule := target createModuleNamed: aJinModule name fromFile:export.
	export ensureDelete.
	
	^ newModule
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateModuleForm: aModuleForm into: form [
	| content |
	content := aModuleForm code content.
	form module code deleteLine: 1.
	form module code insertLines: content.
	content = 'Option Compare Database'
		ifTrue: [ content := 'Option Compare Database
		Option Explicit' ].
	form module code insertLines: ' '
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateQuery: aJinQuery [
	target database
		createQueryDefNamed: aJinQuery name
		sql: aJinQuery sql
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateRelations [
	self visitCollection: source relations
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateReport: aJinReport [
	| report tuples |
	[ report := target createReport ]
		on: Error
		do: [ :e | 
			target reopen.
			report := target createReport ].
	renames
		add:
			(FuRename
				object: report
				to: aJinReport name
				hasModule: aJinReport hasModule
				moduleContents: aJinReport module code contents).
	aJinReport groupLevels
		do: [ :g | self replicateGroupLevel: g into: report ].
	aJinReport hasHeaderFooter
		ifTrue: [ report installHeaderFooter ].
	aJinReport hasPageHeaderFooter
		ifTrue: [ report installPageHeaderFooter ]
		ifFalse: [ report ensureItHasNonPageHeaderFooter ].
	self infuseProperties2: aJinReport body into: report body.
	self sectionsFrom: aJinReport into: report body.
	tuples := Dictionary new.
	aJinReport controls
		do: [ :c | 
			c isEmptyCell
				ifFalse:
					[ "				https://docs.microsoft.com/en-us/office/vba/api/Access.EmptyCell
				An EmptyCell object is created when a control layout contains an empty cell. You cannot explicitly create or delete an EmptyCell object.
				" tuples at: c put: (self create: c inReport: report) ] ].
	tuples
		keysAndValuesDo: [ :cs :ct | self infuseProperties2: cs into: ct ].
	self replicateModuleForm: aJinReport module into: report.
	report save.
	report close.
	^ report
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateTable: aJinTable [
	aJinTable isLocal
		ifTrue: [ target database
				createTableNamed: aJinTable name
				fields: aJinTable fields
				attributes: aJinTable attributes
				sourceTableName: aJinTable sourceTableName
				connect: aJinTable connect ]
		ifFalse: [ target database
				createRemoteTableNamed: aJinTable name
				fields: aJinTable fields
				attributes: aJinTable attributes
				sourceTableName: aJinTable sourceTableName
				connect: aJinTable connect ].
	self registerStatistic: aJinTable.
	^ target tables detect: [ :t | t name = aJinTable name ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateTables [
	self visitCollection: source tables
]

{ #category : #'as yet unclassified' }
FuReplicant >> sectionsFrom: aJinReport into: report [
	| sectionFrom sectionTo |
	0 to: 10 do: [ :i | 
		[ sectionFrom := aJinReport body handle
			propertyNamed: #Section
			withArguments: {i}.
		sectionTo := report body handle
			propertyNamed: #Section
			withArguments: {i}.
		sectionTo
			propertyNamed: #Height
			put: (sectionFrom propertyNamed: #Height) ]
			on: Error
			do: [ :e | ] ]
]

{ #category : #initialization }
FuReplicant >> set: aName from: aHandle to: otherHandle [
	| value |
	[ value := aHandle propertyNamed: aName ]
		on: Win32Error , KeyNotFound
		do:
			[ :e | ^ self registerStatisticPropertyFailedToRead: aName childOf: aHandle ].
	value = (otherHandle propertyNamed: aName)
		ifFalse: [ [ (otherHandle propertyNamed: aName putIfWritable: value)
				ifFalse: [ ^ self registerStatisticPropertyReadOnly: aName childOf: aHandle ] ]
				on: Win32Error , KeyNotFound
				do:
					[ :e | ^ self registerStatisticPropertyFailedToWrite: aName childOf: aHandle ] ].
	self registerStatisticProperty: aName childOf: aHandle 
]

{ #category : #initialization }
FuReplicant >> set: aName from: aHandle to: otherHandle context: aModelObject [ 
	| value |
	[ value := aHandle propertyNamed: aName ]
		on: Win32Error , KeyNotFound
		do:
			[ :e | ^ self registerStatisticPropertyFailedToRead: aName childOf: aModelObject ].
	value = (otherHandle propertyNamed: aName)
		ifFalse: [ [ (otherHandle propertyNamed: aName putIfWritable: value)
				ifFalse: [ ^ self registerStatisticPropertyReadOnly: aName childOf:  aModelObject ] ]
				on: Win32Error , KeyNotFound
				do:
					[ :e | ^ self registerStatisticPropertyFailedToWrite: aName childOf:  aModelObject ] ].
	self registerStatisticProperty: aName childOf:  aModelObject 
]

{ #category : #accessing }
FuReplicant >> source: aJinAccessProject [
	source := aJinAccessProject
]

{ #category : #'as yet unclassified' }
FuReplicant >> statisticsPerType [
	^ statistics values groupedBy: #type
]

{ #category : #accessing }
FuReplicant >> target: aJinAccessProject [ 
	target := aJinAccessProject
]

{ #category : #'as yet unclassified' }
FuReplicant >> transferContentFrom: aTable to: anOtherTable [
	| from to x |
	aTable close.
	anOtherTable close.
	to := anOtherTable recordset.
	from := aTable recordset.
	x := 1.
	[ from atEnd ]
		whileFalse:
			[ to nextPut: from next.
			x := x + 1 ]. from close.
	to close.
	^ x
]

{ #category : #'visit-first-objects' }
FuReplicant >> visitCollection: aCollection [
	aCollection
		do: [ :element | 
			[ 
			self registerStatistic: element.
			element acceptVisitor: self.
			 ]
				on: Win32Error
				do: [ :e | 
					e passIfNotError0x80020009.
					self registerFailStatistic: element error: e ] ]
]

{ #category : #'visit-first-objects' }
FuReplicant >> visitForm: aForm [
	[ self replicateForm: aForm ]
		on: Win32Error
		do: [ :e | 
			target reopen.
			self replicateForm: aForm ].
	aForm ensureUnload
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitIndex: aJinIndex [
	| index |
	[ aJinIndex isForeign
		ifFalse: [ index := stack top createIndex: aJinIndex name.
			aJinIndex fields do: [ :f | index createField: f name ].
			index clustered: aJinIndex clustered.
			index ignoreNulls: aJinIndex ignoreNulls.
			index primaryKey: aJinIndex primaryKey.
			index unique: aJinIndex unique.
			stack top registerIndex: index.
			self registerStatisticChild: aJinIndex ] ]
		on: Win32Error
		do: [ :e | 
			e passIfNotError0x80020009.
			self registerFailStatisticChild: aJinIndex error: e messageText ]
]

{ #category : #'visit-first-objects' }
FuReplicant >> visitMacro: aModelObject [
	self
		push: (self replicateMacro: aModelObject)
		during: [ super visitMacro: aModelObject ]
]

{ #category : #'visit-first-objects' }
FuReplicant >> visitModule: aModule [
	self replicateModule: aModule.
	aModule ensureUnload
]

{ #category : #'visit-first-objects' }
FuReplicant >> visitProject: aJinAccessProject [

	self visitCollection: aJinAccessProject references.
	self visitCollection: aJinAccessProject tables.
	self visitCollection: aJinAccessProject queries.
	self visitCollection: aJinAccessProject modules.
	target compileAll.
	self visitCollection: aJinAccessProject reports.
	target compileAll.
	self visitCollection: aJinAccessProject forms.
	target compileAll.
	self applyRenames.
	self visitCollection: aJinAccessProject relations
]

{ #category : #'visit-first-objects' }
FuReplicant >> visitQuery: anObject [
	self
		push: (self replicateQuery: anObject)
		during: [ super visitQuery: anObject ].
	anObject ensureUnload
]

{ #category : #'visit-first-objects' }
FuReplicant >> visitReference: aReference [
	target
		addReference: aReference name
		builtIn: aReference isBuiltIn
		path: aReference path
		guid: aReference guid
		major: aReference major
		minor: aReference minor
]

{ #category : #'visit-first-objects' }
FuReplicant >> visitReport: aModelObject [
	self replicateReport: aModelObject.
	aModelObject ensureUnload
]

{ #category : #'visit-first-objects' }
FuReplicant >> visitTable: anObject [
	anObject isSystemTable
		ifTrue: [ ^ self ].
	target tables
		detect: [ :t | t name = anObject name ]
		ifNone: [ self
				push: (self replicateTable: anObject)
				during: [ [ | amount |
					amount := self transferContentFrom: anObject to: stack top.
					(statistics at: anObject name)
						addChild:
							(FuObject new
								name: #TransferContent;
								type: #NewRows;
								success: true;
								properties: {amount} asOrderedCollection ;
								yourself) ]
						on: Win32Error
						do: [ :e | 
							e passIfNotError0x80020009.
							(statistics at: anObject name)
								addChild:
									(FuObject new
										name: #TransferContent;
										type: #NewRows;
										success: false;
										errorText: e messageText;
										yourself).
							super visitTable: anObject ] ] ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitTableRelation: aJinTableRelation [
	(aJinTableRelation isReflexiveRelation
		or: [ aJinTableRelation table isSystemTable ])
		ifTrue: [ ^ self ].
	target database createRelation: aJinTableRelation
]
