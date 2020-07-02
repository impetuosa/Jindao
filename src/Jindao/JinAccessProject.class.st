"
I represent a access project. I am instantiated by the access application object. 
I am a first access to collections of defined elements 
"
Class {
	#name : #JinAccessProject,
	#superclass : #Object,
	#instVars : [
		'programHandle',
		'dataHandle',
		'application',
		'projectPath'
	],
	#category : #'Jindao-Core'
}

{ #category : #'initialize-release' }
JinAccessProject >> acceptVisitor: aVisitor [
	^ aVisitor visitProject: self 
]

{ #category : #'as yet unclassified' }
JinAccessProject >> activeEntity [
	| entity |
	entity := application activeEntity.
	(entity getTypeInfo name beginsWith: '_Report')
		ifTrue: [ ^ self reports
				detect: [ :r | r name = (entity propertyNamed: #Name) ] ].
	(entity getTypeInfo name beginsWith: '_Form')
		ifTrue:
			[ ^ self forms detect: [ :r | r name = (entity propertyNamed: #Name) ] ].
	self error: 'UnexpectedKind of entity '
]

{ #category : #'as yet unclassified' }
JinAccessProject >> activeEntityName [
	^ application activeEntity propertyNamed:#Name 
]

{ #category : #'as yet unclassified' }
JinAccessProject >> addReference: aName builtIn: isBuiltIn path: aFileReference guid: aGuid major: aMajor minor: aMinor [
	^ application
		addReference: aName
		builtIn: isBuiltIn
		path: aFileReference
		guid: aGuid
		major: aMajor
		minor: aMinor
]

{ #category : #accessing }
JinAccessProject >> application [
	^ application
]

{ #category : #'initialize-release' }
JinAccessProject >> close [
	application closeProject: self.
	programHandle := nil.
	dataHandle := nil
]

{ #category : #'as yet unclassified' }
JinAccessProject >> close: aJinForm [
	[ application close: aJinForm ]
		on: Error
		do: [ :e | self assert: aJinForm isLoaded not ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> close: aJinForm save: aBool [
	application close: aJinForm save: aBool
]

{ #category : #'as yet unclassified' }
JinAccessProject >> compileAll [
	[ application compileAll ]
		on: Error
		do: [ self reopen ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createControl: aName inForm: aJinForm type: aTypeNumber section: aSection [
	application
		createControl: aName
		inForm: aJinForm
		type: aTypeNumber
		section: aSection.
	^ aJinForm controls detect: [ :c | c name = aName ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createControl: aName inForm: aJinForm type: aTypeNumber section: aSection parent: aParentName [
	application
		createControl: aName
		inForm: aJinForm
		type: aTypeNumber
		section: aSection
		parent: aParentName.
	^ aJinForm controls detect: [ :c | c name = aName ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createControl: aName inReport: aJinReport type: aTypeNumber section: aSection [
	application
		createControl: aName
		inReport: aJinReport
		type: aTypeNumber
		section: aSection.
	^ aJinReport controls detect: [ :c | c name = aName ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createForm [
	| formHandle |

	formHandle := application createForm.
	^ (self forms
		detect: [ :r | r name = (formHandle propertyNamed: #Name) ])
		body:
			(JinFormBody new
				handle: formHandle;
				yourself);
		yourself
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createFormNamed: aString [
	application createFormNamed: aString.
	^ (self forms detect: [ :r | r name = aString ])
		body;
		yourself

	
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createGroupLevel: aJinReport expression: anExpression header: aBoolean footer: anOtherBoolean [
	| long |
	long := application
		createGroupLevel: aJinReport
		expression: anExpression
		header: aBoolean
		footer: anOtherBoolean.
	^ aJinReport groupLevelNumber: long
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createModule: aKind named: aName properties: aCollection [
	^ self modules
		detect: [ :m | m name = aName ]
		ifFound: [ :m | m ]
		ifNone: [ | f module |
			f := self
				ensureFileModuleKind: aKind
				name: aName
				properties: aCollection.
			self vbeProject import: f.
			f delete.
			module := self modules detect: [ :m | m name = aName ].
			module save.
			^ module ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createModuleNamed: aName fromFile: aFileReference [
	^ self modules
		detect: [ :m | m name = aName ]
		ifFound: [ :m | m ]
		ifNone: [ self vbeProject import: aFileReference.
			application saveModuleNamed: aName.
			^ self modules detect: [ :m | m name = aName ] ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createReport [
	| createReport |
	createReport := application createReport.
	^ (self reports
		detect: [ :r | r name = (createReport propertyNamed: #Name) ])
		body: (JinReportBody new handle: createReport; yourself);
		yourself
]

{ #category : #'as yet unclassified' }
JinAccessProject >> createReportNamed: aString [
	application createReportNamed: aString.
	^ (self reports detect: [ :r | r name = aString ])
		body;
		yourself
]

{ #category : #'as yet unclassified' }
JinAccessProject >> database [
	^ JinDatabaseEngine new
		handle: application database;
		project: self; 
		yourself
]

{ #category : #'as yet unclassified' }
JinAccessProject >> descritionFor: aString [
	^ (self forms detect: [ :f | f name = aString ]) description
]

{ #category : #'as yet unclassified' }
JinAccessProject >> ensureFileModuleKind: aKind name: aName properties: aCollection [
	| f content |
	f := (aName , '.bas') asFileReference.
	f ensureDelete.
	aCollection size > 2
		ifTrue: [ self halt ].
	aKind = #ClassModule
		ifTrue: [ 
f := (aName , '.cls') asFileReference.
content :=  'VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  ''True
END
Attribute VB_Name = "{1}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
' format: {aName} ]
		ifFalse: [ 
f := (aName , '.bas') asFileReference.
content := 'Attribute VB_Name = "{1}"
' format: {aName} ].
	f ensureCreateFile.
	f writeStream
		nextPutAll: content;
		close.
	^ f
]

{ #category : #'as yet unclassified' }
JinAccessProject >> ensureItHasNonPageHeaderFooter: aJinFormOrModule [
	" acCmdPageHdrFtr 	182 "

	self assert: self activeEntityName = aJinFormOrModule name.
	aJinFormOrModule hasPageHeaderFooter
		ifTrue: [ application command: #RunCommand withArguments: {182} ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> ensurePageHeaderFooter: aJinFormOrModule [
	" acCmdPageHdrFtr 	182 "

	self assert: self activeEntityName = aJinFormOrModule name.
	aJinFormOrModule hasPageHeaderFooter
		ifFalse: [ application command: #RunCommand withArguments: {182} ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> export: aJinTable toFolder: aFileReference [
	^ application export: aJinTable toFolder: aFileReference
]

{ #category : #'as yet unclassified' }
JinAccessProject >> exportXml: aJinTable toFolder: aFileReference [
	application exportXml: aJinTable toFolder: aFileReference
]

{ #category : #'as yet unclassified' }
JinAccessProject >> fileName [
	^ projectPath basename
]

{ #category : #'form-api' }
JinAccessProject >> forms [
	^ JinCollection newDefault
		handle: (programHandle propertyNamed: #AllForms)
		factory:
			((JinFirstClassCitizenModelFactory defaultFor: JinForm)
				project: self;
				yourself)
]

{ #category : #accessing }
JinAccessProject >> fullName [
	^ programHandle propertyNamed:#FullName
]

{ #category : #'initialize-release' }
JinAccessProject >> handle: aCOMDispatchInstance dataHandle: aDataHandle application: anApplication [
	application := anApplication .
	programHandle := aCOMDispatchInstance.
	dataHandle := aDataHandle
]

{ #category : #'as yet unclassified' }
JinAccessProject >> installHeaderFooterOn: aJinReport [
	" acCmdReportHdrFtr 	37 	 "
	
	self assert: self activeEntityName = aJinReport name .
	application command: #RunCommand withArguments: {37}
]

{ #category : #'as yet unclassified' }
JinAccessProject >> installReportHeaderFooterOn: aJinReport [
	"acCmdFormHdrFtr 	36 	 "

	self assert: self activeEntityName = aJinReport name.
	application command: #RunCommand withArguments: {36}
]

{ #category : #'macro-api' }
JinAccessProject >> macros [
	^ JinCollection newDefault
		handle: (programHandle propertyNamed: #AllMacros)
		factory:
			((JinFirstClassCitizenModelFactory defaultFor: JinMacro)
				project: self;
				yourself)
]

{ #category : #'module-api' }
JinAccessProject >> modules [
	^ JinCollection newDefault
		handle: (programHandle propertyNamed: #AllModules)
		factory:
			((JinFirstClassCitizenModelFactory defaultFor: JinModule)
				project: self;
				yourself)
]

{ #category : #accessing }
JinAccessProject >> name [
	^ programHandle propertyNamed: #Name 
]

{ #category : #'form-api' }
JinAccessProject >> newForm [
	^ application newForm 
]

{ #category : #'form-api' }
JinAccessProject >> openForm: aJinForm [
	^ application openForm: aJinForm.

]

{ #category : #'module-api' }
JinAccessProject >> openModule: aJinModule [
	^ application openModule: aJinModule
]

{ #category : #'query-api' }
JinAccessProject >> openQuery: aJinQuery [
	^ application openQuery: aJinQuery
]

{ #category : #'report-api' }
JinAccessProject >> openReport: aJinReport [ 
	^ application openReport: aJinReport 
]

{ #category : #'table-api' }
JinAccessProject >> openTable: aJinTable [ 
	^ application openTable: aJinTable 
]

{ #category : #'as yet unclassified' }
JinAccessProject >> parent [
	^ projectPath
]

{ #category : #'as yet unclassified' }
JinAccessProject >> projectPath: aFileReference [
	projectPath := aFileReference
]

{ #category : #'query-api' }
JinAccessProject >> queries [
	^ JinCollection newDefault
		handle: (dataHandle propertyNamed: #AllQueries)
		factory:
			((JinFirstClassCitizenModelFactory defaultFor: JinQuery)
				project: self;
				yourself)
]

{ #category : #accessing }
JinAccessProject >> references [
	^ application references
]

{ #category : #'as yet unclassified' }
JinAccessProject >> relations [
	^ JinCollection newDefault
		handle: (application database propertyNamed: #Relations)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinTableRelation;
				scopedBy: self;
				yourself)
]

{ #category : #'as yet unclassified' }
JinAccessProject >> rename: anObject with: aName [
	^ application rename: anObject with: aName
]

{ #category : #accessing }
JinAccessProject >> reopen [
	application reopen: projectPath into: self.
	5 seconds wait. 
]

{ #category : #'report-api' }
JinAccessProject >> reports [
	^ JinCollection newDefault
		handle: (programHandle propertyNamed: #AllReports)
		factory:
			((JinFirstClassCitizenModelFactory defaultFor: JinReport)
				project: self;
				yourself)
]

{ #category : #'as yet unclassified' }
JinAccessProject >> sanitizedName [
	| s |
	s := (self name readStream upTo: $.) asLowercase.
	s = 'access_example_vba'
		ifTrue: [ ^ 'example_database' ].
	^ s
]

{ #category : #'as yet unclassified' }
JinAccessProject >> save: aJinModule [ 
	application save: aJinModule 
]

{ #category : #'table-api' }
JinAccessProject >> tables [
	^ JinCollection newDefault
		handle: (dataHandle propertyNamed: #AllTables)
		factory:
			((JinFirstClassCitizenModelFactory defaultFor: JinTable)
				project: self;
				yourself)
]

{ #category : #'as yet unclassified' }
JinAccessProject >> vbeComponentFor: aJinModule [
	^ application vbeComponentFor: aJinModule in: self
]

{ #category : #'as yet unclassified' }
JinAccessProject >> vbeProject [
	^ application vbeProjectFor: self 
]
