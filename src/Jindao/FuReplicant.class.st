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
			| value |
			value := [ p value ]
				on: Error
				do: [ :e | 
					((e isKindOf: KeyNotFound) or: [ e isError0x80020009 ])
						ifTrue: [ nil ]
						ifFalse: [ e signal ] ].
			table at: p name put: value ].
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
	form := target createFormNamed: aForm name.
	aForm hasHeaderFooter
		ifTrue: [ form installHeaderFooter ].
	aForm hasPageHeaderFooter
		ifTrue: [ form installPageHeaderFooter ]
		ifFalse: [ form ensureItHasNonPageHeaderFooter ].
	tuples := Dictionary new.
	aForm controls
		do: [ :c | 
			c isEmptyCell ifFalse: [
"				https://docs.microsoft.com/en-us/office/vba/api/Access.EmptyCell
				An EmptyCell object is created when a control layout contains an empty cell. You cannot explicitly create or delete an EmptyCell object.
				"
			tuples
				at: c
				put:
					(form
						createControl: c name
						type: c controlTypeNumber
						section: c section) ]].
	form module code insertLines: aForm module code content.
	tuples
		keysAndValuesDo: [ :cs :ct | self infuseProperties: cs into: ct ].
	self infuseProperties: aForm into: form.
	form save.
	form close.
	^ form
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
FuReplicant >> replicateQuery: aJinQuery [ 
	target database createQueryDefNamed: aJinQuery name sql: aJinQuery sql. 
	target application refreshDatabaseWindow
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateReport: aJinReport [
	| report tuples |
	report := target createReportNamed: aJinReport name.
	aJinReport groupLevels
		do: [ :g | self replicateGroupLevel: g into: report ].
	aJinReport hasHeaderFooter
		ifTrue: [ report installHeaderFooter ].
	aJinReport hasPageHeaderFooter
		ifTrue: [ report installPageHeaderFooter ]
		ifFalse: [ report ensureItHasNonPageHeaderFooter ].
	tuples := Dictionary new.
	aJinReport controls
		do: [ :c | 
			c isEmptyCell ifFalse: [
"				https://docs.microsoft.com/en-us/office/vba/api/Access.EmptyCell
				An EmptyCell object is created when a control layout contains an empty cell. You cannot explicitly create or delete an EmptyCell object.
				"
			tuples
				at: c
				put:
					(report
						createControl: c name
						type: c controlTypeNumber
						section: c section) ]].
	report module code insertLines: aJinReport module code content.
	tuples
		keysAndValuesDo: [ :cs :ct | self infuseProperties: cs into: ct ].
	self infuseProperties: aJinReport into: report.
	report save.
	report close.
	^ report
]

{ #category : #'as yet unclassified' }
FuReplicant >> replicateTable: aJinTable [
	| table |
	table := aJinTable isLocal
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
	^ target
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
	self
		push: (self replicateForm: aForm)
		during: [ super visitForm: aForm.
			stack top ensureUnload ].
	aForm ensureUnload
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitFormControl: aControl [
	self replicateControl: aControl
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitFormModule: aModule [
	self
		push: (self replicateModuleForm: aModule)
		during: [ super visitFormModule: aModule ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitMacro: aModelObject [
	self
		push: (self replicateMacro: aModelObject)
		during: [ super visitMacro: aModelObject ]
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitModule: aModule [
	self replicateModule: aModule
]

{ #category : #'as yet unclassified' }
FuReplicant >> visitQuery: anObject [
	self
		push: (self replicateQuery: anObject)
		during: [ super visitQuery: anObject ]
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
	target application refreshDatabaseWindow 
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
