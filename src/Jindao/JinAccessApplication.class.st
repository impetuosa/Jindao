"
This is the basic access handle manager. 

	access := COMDispatchInstance createInstanceByName: 'Access.Application'.
	access propertyNamed: 'Visible' put: true. 
	access dispatch: 'OpenCurrentDatabase' withArguments: { 'C:\Users\santiago\Documents\Northwind.accdb' }.
	
	self halt. 
	
	""a COMDispatchInstance(@ 16r00D791E8)""
access propertyNamed: 'CurrentProject'.

(access propertyNamed: 'DoCmd') dispatch: 'OpenForm' withArguments: { 'Purchase Order Details' . 1 }.
access propertyNamed: 'Modules'.

(access propertyNamed: 'Modules') propertyNamed: 'Count'.

oneModule := (access propertyNamed: 'Modules')  propertyNamed: 'Item' withArguments: { 0 }.
oneModule propertyNamed: 'Lines' withArguments: { 1 . 100 }.

(access propertyNamed: 'DoCmd') dispatch: 'OpenModule' withArguments: { 'Inventory' }.

(access propertyNamed: 'Modules') propertyNamed: 'Item' withArguments: { 0 }.
	
	
	access dispatch: 'Quit'.
	access finalize. 
"
Class {
	#name : #JinAccessApplication,
	#superclass : #JinAccessObject,
	#instVars : [
		'visible',
		'references'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinAccessApplication class >> default [
	^ self new
]

{ #category : #visiting }
JinAccessApplication >> acceptVisitor: aVisitor [
	aVisitor visitApplication: self 
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> activeEntity [
	^ [ self activeForm ]
		on: Win32Error
		do: [ :e | 
			e passIfNotError0x80020009.
			self activeReport ]
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> activeForm [
	| screen |
	screen := handle propertyNamed: #Screen.
	^ screen propertyNamed: #ActiveForm
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> activeReport [
	| screen |
	screen := handle propertyNamed: #Screen.
	^ screen propertyNamed: #ActiveReport
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> addReference: aName builtIn: isBuiltIn path: aFileReference guid: aGuid major: aMajor minor: aMinor [
	| addedRef |
	self references
		detect:
			[ :r | r guid = aGuid and: [ r major = aMajor and: [ r minor = aMinor ] ] ]
		ifFound: [ :r | ^ r ]
		ifNone: [ [ (handle propertyNamed: #References)
				dispatch: #AddFromFile
				withArguments: {aFileReference fullName} ]
				on: Error
				do: [ :e | 
					(handle propertyNamed: #References)
						dispatch: #AddFromGuid
						withArguments:
							{aGuid.
							aMajor.
							aMinor} ].
			^ self references detect: [ :r | r name = aName ] ]
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> close: aJinModelObject [
	self close: aJinModelObject save: false
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> close: aJinModelObject save: aBool [
	"	
		Third parameter is about saving or not: 
		
		acSaveNo  == 2 
		acSavePrompt == 0
		acSaveYes == 1
		"

	self
		command: #Close
		withArguments:
			{aJinModelObject typeNumber.
			aJinModelObject name.
			(aBool
				ifTrue: [ 1 ]
				ifFalse: [ 2 ])}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> close: aName type: aTypeNumber save: aBool [
	"	
		Third parameter is about saving or not: 
		
		acSaveNo  == 2 
		acSavePrompt == 0
		acSaveYes == 1
		"

	self
		command: #Close
		withArguments:
			{aTypeNumber.
			aName.
			(aBool
				ifTrue: [ 1 ]
				ifFalse: [ 2 ])}
]

{ #category : #initialization }
JinAccessApplication >> closeProject: aProject [
	self handle dispatch: 'CloseCurrentDatabase' withArguments: {}
]

{ #category : #convenience }
JinAccessApplication >> command [
	^ handle propertyNamed: #DoCmd
]

{ #category : #convenience }
JinAccessApplication >> command: aString withArguments: aCollection [ 
	^ self command dispatch: aString withArguments: aCollection 
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> compileAll [
	"acCmdCompileAllModules 	125"

	self command: #RunCommand withArguments: {125}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createControl: aName inForm: aJinForm type: aTypeNumber section: aSection [
	| control |
	control := handle
		dispatch: #CreateControl
		withArguments:
			{aJinForm name.
			aTypeNumber.
			aSection}.
	control propertyNamed: #Name put: aName
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createControl: aName inForm: aJinForm type: aTypeNumber section: aSection parent: aParentName [
	| control |
	control := handle
		dispatch: #CreateControl
		withArguments:
			{aJinForm name.
			aTypeNumber.
			aSection.
			aParentName}.
	control propertyNamed: #Name put: aName
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createControl: aName inReport: aJinReport type: aTypeNumber section: aSection [
	| control |
	control := handle
		dispatch: #CreateReportControl
		withArguments:
			{aJinReport name.
			aTypeNumber .aSection }.
	control propertyNamed: #Name put: aName
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createForm [
	| form defaultName |
	self ensureNonOtherFormtIsOpen.
	form := handle dispatch: #CreateForm.
	defaultName := form propertyNamed: #Name.
	self
		command: #Save
		withArguments:
			{JinForm typeNumber.
			defaultName}.
	^ form
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createFormNamed: aString [
	| form defaultName |
	form := handle dispatch: #CreateForm.
	defaultName := form propertyNamed: #Name.
	self
		command: #Close
		withArguments:
			{JinForm typeNumber.
			defaultName.
			1}.
	self
		command: #Rename
		withArguments:
			{aString.
			JinForm typeNumber.
			defaultName}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createGroupLevel: aJinReport expression: anExpression header: aBoolean footer: anOtherBoolean [
	^ handle
		dispatch: #CreateGroupLevel
		withArguments:
			{aJinReport name.
			anExpression.
			(aBoolean
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]).
			(anOtherBoolean
				ifTrue: [ 1 ]
				ifFalse: [ 0 ])}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createModule: aKind named: aName properties: aCollection into: aProject [
	| f |
	f := self
		ensureFileModuleKind: aKind
		name: aName
		properties: aCollection.
		
		
'Application.VBE.ActiveVBProject.VBComponents.Import mcstrImportExportModule
   
    Application.DoCmd.Save acModule, mcstrModuleName
   
    Application.RefreshDatabaseWindow '
	handle
		dispatch: #LoadFromText
		withArguments:
			{JinModule typeNumber.
			aName.
			f fullName}.
	f delete
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createNewProject: aFileReference [
	self handle
		dispatch: 'NewCurrentDatabase'
		withArguments: {aFileReference fullName}.
	^ JinAccessProject new
		handle: (handle propertyNamed: 'CurrentProject')
			dataHandle: (handle propertyNamed: #CurrentData)
			application: self;
		projectPath: aFileReference;
		yourself
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createReport [
	| report defaultName |
	self ensureNonOtherReportIsOpen.
	[ report := handle dispatch: #CreateReport ]
		on: Win32Error
		do: [ :e | report := handle dispatch: #CreateReport ].
	defaultName := report propertyNamed: #Name.
	self
		command: #Save
		withArguments:
			{JinReport typeNumber.
			defaultName}.
	^ report
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> createReportNamed: aString [
	| report defaultName |
	report := handle dispatch: #CreateReport.
	defaultName := (report propertyNamed: #Name).

	self
		command: #Close
		withArguments:
			{JinReport typeNumber.
			defaultName . 
			1 }.
	
	self
		command: #Rename
		withArguments:
			{aString.
			JinReport typeNumber.
			defaultName}.
	
	
]

{ #category : #'table-api' }
JinAccessApplication >> database [
	^ (self workspace propertyNamed: #Databases) propertyNamed:#Item withArguments:{0}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> ensureFileModuleKind: aKind name: aName properties: aCollection [
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
JinAccessApplication >> ensureNonOtherFormtIsOpen [
	[ self
		close: (self activeForm propertyNamed: #Name)
		type: JinForm typeNumber
		save: false ]
		on: Error
		do: [ :e |  ]
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> ensureNonOtherReportIsOpen [
	[ self
		close: (self activeReport propertyNamed: #Name)
		type: JinReport typeNumber
		save: false ]
		on: Error
		do: [ :e |  ]
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> export: aJinModelObject toFolder: aFileReference [
	| destination |
	destination := aFileReference / aJinModelObject name
		, (aJinModelObject class name copyReplaceAll: 'Jin' with: '').
	handle
		dispatch: #SaveAsText
		withArguments:
			{aJinModelObject typeNumber.
			aJinModelObject name.
			destination fullName}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> exportXml: aJinModelObject toFolder: aFileReference [
	| destination xsd |
	destination := aFileReference / aJinModelObject name
		,
			((aJinModelObject class name copyReplaceAll: 'Jin' with: '')
				, 'CONTENT').
	xsd := aFileReference / aJinModelObject name
		, (aJinModelObject class name copyReplaceAll: 'Jin' with: '').
	handle
		dispatch: #ExportXML
		withArguments:
			{aJinModelObject typeNumber.
			aJinModelObject name.
			destination fullName.
			xsd fullName}
]

{ #category : #initialization }
JinAccessApplication >> handle [
	^ handle
		ifNil: [ handle := COMDispatchInstance
				createInstanceByName: 'Access.Application'.
			handle propertyNamed: 'Visible' put: self visible ]
]

{ #category : #initialization }
JinAccessApplication >> initialize [
	super initialize.
	" Not sure if it is needed all the time but maybe "
	Ole32Lib uniqueInstance initLibrary.
	
]

{ #category : #initialization }
JinAccessApplication >> name [
	^ 'Application'
]

{ #category : #initialization }
JinAccessApplication >> open: aFileReference [
	self handle
		dispatch: 'OpenCurrentDatabase'
		withArguments: {aFileReference fullName}.
	^ JinAccessProject new
		handle: (handle propertyNamed: 'CurrentProject')
			dataHandle: (handle propertyNamed: #CurrentData)
			application: self;
		projectPath: aFileReference;
		yourself
]

{ #category : #initialization }
JinAccessApplication >> open: aFileReference into: aProject [
	self handle
		dispatch: 'OpenCurrentDatabase'
		withArguments: {aFileReference fullName}.
	^ aProject
		handle: (handle propertyNamed: 'CurrentProject')
			dataHandle: (handle propertyNamed: #CurrentData)
			application: self;
		projectPath: aFileReference;
		yourself
]

{ #category : #'form-api' }
JinAccessApplication >> openForm: aJinForm [
	self
		command: #OpenForm
		withArguments:
			{aJinForm name.
			1}.
	^ self openedFormsHandles detect: [ :m | m name = aJinForm name ]
]

{ #category : #'module-api' }
JinAccessApplication >> openModule: aJinModule [
	self command: #OpenModule withArguments: {aJinModule name}.
	^ self openedModuleHandles detect: [ :m | m name = aJinModule name ]
]

{ #category : #'query-api' }
JinAccessApplication >> openQuery: aQuery [
	self
		command: #OpenQuery
		withArguments:
			{aQuery name.
			1}.
	
	^ self openedQueryHandles detect: [ :m | m name = aQuery name ]
]

{ #category : #'report-api' }
JinAccessApplication >> openReport: aJinReport [ 
	self command: #OpenReport withArguments: {aJinReport name . 1}.
	^ self openedReportHandles detect: [ :m | m name = aJinReport name ]
]

{ #category : #'table-api' }
JinAccessApplication >> openTable: aJinTable [
	"
	self
		command: #OpenTable
		withArguments:
			{aJinTable name.
			1}."

	^ self openedTableHandles detect: [ :m | m name = aJinTable name ]
]

{ #category : #'form-api' }
JinAccessApplication >> openedFormsHandles [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Forms)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinFormBody ;
				yourself)
]

{ #category : #'module-api' }
JinAccessApplication >> openedModuleHandles [
^ JinCollection newDefault
		handle: (handle propertyNamed: #Modules)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinModuleBody  ;
				yourself)
	
]

{ #category : #'query-api' }
JinAccessApplication >> openedQueryHandles [
	^ JinCollection newDefault
		handle: (self database propertyNamed: #QueryDefs)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinQueryBody;
				yourself)
]

{ #category : #'report-api' }
JinAccessApplication >> openedReportHandles [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Reports)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinReportBody ;
				yourself)
]

{ #category : #'table-api' }
JinAccessApplication >> openedTableHandles [
	^ JinCollection newDefault
		handle: (self database propertyNamed: #TableDefs)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinTableBody;
				yourself)
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> quit [
	[ handle dispatch: #Quit ]
		ensure: [ handle := nil ]
]

{ #category : #accessing }
JinAccessApplication >> references [
	^ JinCollection newDefaultForMethod
		handle: (handle propertyNamed: #References)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinReference;
				yourself)
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> refreshDatabaseWindow [
	handle dispatch: #RefreshDatabaseWindow
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> rename: aName typeNumber: aNumber with: aNewName [
	self
		command: #Rename
		withArguments:
			{aNewName.
			aNumber.
			aName}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> rename: anObject with: aName [
	self
		rename: anObject name
		typeNumber: anObject typeNumber
		with: aName
]

{ #category : #initialization }
JinAccessApplication >> reopen: aFileReference into: aProject [
	[ aProject close ]
		on: Error
		do: [ :e |  ].
	[ self quit ]
		on: Error
		do: [ :e |  ].
	self open: aFileReference into: aProject
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> save: aJinModelObject [


	self
		command: #Save
		withArguments:
			{aJinModelObject typeNumber.
			aJinModelObject name}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> saveModuleNamed: aString [
	self
		command: #Save
		withArguments:
			{JinModule typeNumber.
			aString}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> vbeComponentFor: aJinModule in: aJinAccessProject [
	^ (self vbeProjectFor: aJinAccessProject) components
		detect: [ :c | c name = aJinModule vbeComponentName ]
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> vbeProjectFor: aJinAccessProject [
	^ self vbeProjects
		detect: [ :p | p sanitizedName = aJinAccessProject sanitizedName ]
		ifNone: [ self vbeProjects size = 1
				ifTrue: [ self vbeProjects first ]
				ifFalse: [ self halt ] ]
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> vbeProjects [
	^ JinCollection newDefaultForMethod
		handle: ((handle propertyNamed: #VBE) propertyNamed: #VBProjects)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinVBEProject;
				yourself)
]

{ #category : #initialization }
JinAccessApplication >> visible [
	^ visible ifNil: [ true ]
]

{ #category : #initialization }
JinAccessApplication >> visible: aBoolean [
	visible := aBoolean.
	handle ifNotNil: [ handle propertyNamed: #Visible put: aBoolean ]
]

{ #category : #'table-api' }
JinAccessApplication >> workspace [
	^ ((handle propertyNamed: #DBEngine) propertyNamed:#Workspaces ) propertyNamed:#Item withArguments:{0}.
]
