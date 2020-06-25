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
		'renames'
	],
	#category : #'Jindao-FuZhi'
}

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
FuReplicant >> applyRenames [
	target reopen.
	renames do: [ :r | r applyOn: target ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> infuseProperties2: anAccessObject into: anOtherAccessObject [
	anAccessObject propertiesToInfuse 
		do:
			[ :p | self set: p from: anAccessObject handle to: anOtherAccessObject handle ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> infuseProperties: aJinObjectSource into: aJinObjectTarget [
	| table selectors |
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

{ #category : #'as yet unclassified' }
FuReplicant >> initialize [
	super initialize.
	renames := OrderedCollection new
]

{ #category : #'as yet unclassified' }
FuReplicant >> isEasyToTransfer: aProperty [
	" The property has to be readable, writable, have a getter with none arguments and a setter that receives only one value "
	^ aProperty setter isNotNil
		and: [ aProperty getter isNotNil
				and: [ aProperty setter parameterNames size
						- aProperty setter optionalParameters = 1
						and: [ aProperty getter parameterNames size
								- aProperty getter optionalParameters = 0 ] ] ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicate [
	source acceptVisitor: self
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateForm: aForm [
	| form tuples |
	form := target createForm.
	renames
		add:
			(FuRename
				object: form
				to: aForm name
				hasModule: aForm hasModule
				moduleContents: aForm module code contents).
	
	aForm hasHeaderFooter
		ifTrue: [ form installHeaderFooter ].
	aForm hasPageHeaderFooter
		ifTrue: [ form installPageHeaderFooter ]
		ifFalse: [ form ensureItHasNonPageHeaderFooter ].
	self infuseProperties2: aForm into: form.
	self sectionsFrom: aForm into: form.
	tuples := Dictionary new.
	aForm controls
		do: [ :c | 
			c isEmptyCell
				ifFalse:
					[ "				https://docs.microsoft.com/en-us/office/vba/api/Access.EmptyCell
				An EmptyCell object is created when a control layout contains an empty cell. You cannot explicitly create or delete an EmptyCell object.
				" tuples at: c put: (c createIn: form) ] ].
	form module code insertLines: aForm module code content.
	tuples
		keysAndValuesDo: [ :cs :ct | self infuseProperties2: cs into: ct ].
	self infuseProperties2: aForm into: form.
	self replicateModuleForm: aForm module into: form.
	form save.
	form close.
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
	target database createQueryDefNamed: aJinQuery name sql: aJinQuery sql. 
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateRelations [
	self visitCollection: source relations
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateReport: aJinReport [
	| report tuples |
	report := target createReport.
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
	self infuseProperties2: aJinReport into: report.
	self sectionsFrom: aJinReport into: report.
	tuples := Dictionary new.
	aJinReport controls
		do: [ :c | 
			c isEmptyCell
				ifFalse:
					[ "				https://docs.microsoft.com/en-us/office/vba/api/Access.EmptyCell
				An EmptyCell object is created when a control layout contains an empty cell. You cannot explicitly create or delete an EmptyCell object.
				"
					tuples
						at: c
						put:
							(report
								createControl: c name
								type: c controlTypeNumber
								section: c section) ] ].
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

{ #category : #'as yet unclassified' }
FuReplicant >> set: aName from: aHandle to: otherHandle [
	[ otherHandle
		propertyNamed: aName
		put: (aHandle propertyNamed: aName) ]
		on: Win32Error
		do: [ :e | 
			e passIfNotError0x80020009.
			self halt ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> source: aJinAccessProject [
	source := aJinAccessProject
]

{ #category : #'as yet unclassified' }
FuReplicant >> target: aJinAccessProject [ 
	target := aJinAccessProject
]

{ #category : #'as yet unclassified' }
FuReplicant >> transferContentFrom: aTable to: anOtherTable [
	| from to |
	aTable close.
	anOtherTable close.
	to := anOtherTable recordset.
	from := aTable recordset.
	[ [ from atEnd ] whileFalse: [ to nextPut: from next ] ]
		on: Error
		do: [ :e | 
			(e isKindOf: Win32Error)
				ifFalse: [ self halt ] ].
	from close.
	to close.
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitForm: aForm [
	self replicateForm: aForm.
	aForm ensureUnload.
	
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitIndex: aJinIndex [
	| index |
	aJinIndex isForeign
		ifFalse: [ index := stack top createIndex: aJinIndex name.
			aJinIndex fields do: [ :f | index createField: f name  ].
			index clustered: aJinIndex clustered.
			index ignoreNulls: aJinIndex ignoreNulls.
			index primaryKey: aJinIndex primaryKey.
			index unique: aJinIndex unique.
			stack top registerIndex: index ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitMacro: aModelObject [
	self
		push: (self replicateMacro: aModelObject)
		during: [ super visitMacro: aModelObject ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitModule: aModule [
	self replicateModule: aModule.
	aModule ensureUnload
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
FuReplicant >> visitQuery: anObject [
	self
		push: (self replicateQuery: anObject)
		during: [ super visitQuery: anObject ].
	anObject ensureUnload
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitReference: aReference [
	target
		addReference: aReference name
		builtIn: aReference isBuiltIn
		path: aReference path
		guid: aReference guid
		major: aReference major
		minor: aReference minor
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitReport: aModelObject [
	self replicateReport: aModelObject.
	aModelObject ensureUnload
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitTable: anObject [
	anObject isSystemTable
		ifTrue: [ ^ self ].
	target tables
		detect: [ :t | t name = anObject name ]
		ifNone: [ self
				push: (self replicateTable: anObject)
				during: [ self transferContentFrom: anObject to: stack top.
					super visitTable: anObject ] ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitTableRelation: aJinTableRelation [
	(aJinTableRelation isReflexiveRelation
		or: [ aJinTableRelation table isSystemTable ])
		ifTrue: [ ^ self ].
	target database createRelation: aJinTableRelation
]
