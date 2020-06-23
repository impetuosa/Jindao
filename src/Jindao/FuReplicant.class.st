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
		'target'
	],
	#category : #'Jindao-FuZhi'
}

{ #category : #'as yet unclassified' }
FuReplicant class >> replicate: aJinAccessProject into: aJinAccessProject2 [
	^ self new
		source: aJinAccessProject;
		target: aJinAccessProject2;
		replicate
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
	self replicateModuleForm: aForm module into: form.
	aForm hasHeaderFooter
		ifTrue: [ form installHeaderFooter ].
	aForm hasPageHeaderFooter
		ifTrue: [ form installPageHeaderFooter ]
		ifFalse: [ form ensureItHasNonPageHeaderFooter ].
	self infuseProperties: aForm into: form.
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
		keysAndValuesDo: [ :cs :ct | self infuseProperties: cs into: ct ].
	self infuseProperties: aForm into: form.
	form save.
	form close.
	form rename: aForm name.
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
	content lines size > 1
		ifTrue: [ form module code deleteLine: 1.
			form module code insertLines: content ]
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
	self replicateModuleForm: aJinReport module into: report.
	aJinReport groupLevels
		do: [ :g | self replicateGroupLevel: g into: report ].
	aJinReport hasHeaderFooter
		ifTrue: [ report installHeaderFooter ].
	aJinReport hasPageHeaderFooter
		ifTrue: [ report installPageHeaderFooter ]
		ifFalse: [ report ensureItHasNonPageHeaderFooter ].
	self infuseProperties: aJinReport into: report.
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
		keysAndValuesDo: [ :cs :ct | self infuseProperties: cs into: ct ].
	self infuseProperties: aJinReport into: report.
	report save.
	report close.
	report rename: aJinReport name.
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
FuReplicant >> source: aJinAccessProject [
	source := aJinAccessProject
]

{ #category : #'as yet unclassified' }
FuReplicant >> target: aJinAccessProject [ 
	target := aJinAccessProject
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitForm: aForm [
	self replicateForm: aForm.
	aForm ensureUnload
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
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitTable: anObject [
	anObject isSystemTable
		ifTrue: [ ^ self ].
	target tables
		detect: [ :t | t name = anObject name ]
		ifNone: [ self
				push: (self replicateTable: anObject)
				during: [ super visitTable: anObject ] ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitTableRelation: aJinTableRelation [
	(aJinTableRelation isReflexiveRelation
		or: [ aJinTableRelation table isSystemTable ])
		ifTrue: [ ^ self ].
	target database createRelation: aJinTableRelation
]
