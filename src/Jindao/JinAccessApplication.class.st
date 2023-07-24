"
This is the basic access handle manager. 

Application. First instance to access through COM. This application object is bound to a running instance of Access. It exposes an explorable API, and it allows access to the project components, directly or indirectly.


"
Class {
	#name : #JinAccessApplication,
	#superclass : #JinAccessObject,
	#instVars : [
		'visible',
		'references'
	],
	#category : #'Jindao-MSAccess-Project'
}

{ #category : #'as yet unclassified' }
JinAccessApplication class >> default [
	^ self new
]

{ #category : #visiting }
JinAccessApplication >> acceptVisitor: aVisitor [
	aVisitor visitApplication: self 
]

{ #category : #accessing }
JinAccessApplication >> activeEntity [

	<doc:
	'Obtains the entity that is been seen by the user. Either a report or a form. It fails if none of those is active. '>
	^ [ self activeForm ]
		  on: Win32Error
		  do: [ :e |
			  e passIfNotError0x80020009.
			  self activeReport ]
]

{ #category : #accessing }
JinAccessApplication >> activeForm [

	<doc:
	'Obtains the form that is been seen by the user. It fails if there is no form been seen'>
	| screen |
	screen := handle propertyNamed: #Screen.
	^ screen propertyNamed: #ActiveForm
]

{ #category : #accessing }
JinAccessApplication >> activeReport [

	<doc:
	'Obtains the report that is been seen by the user. It fails if there is no report been seen'>
	| screen |
	screen := handle propertyNamed: #Screen.
	^ screen propertyNamed: #ActiveReport
]

{ #category : #'application-api' }
JinAccessApplication >> addReference: aName builtIn: isBuiltIn path: aFileReference guid: aGuid major: aMajor minor: aMinor [

	<doc:
	'Adds a reference to the module that has been used to open the application. A reference may be an other Microsoft Access module or a DLL'>
	| addedRef |
	self references
		detect: [ :r |
			r guid = aGuid and: [ r major = aMajor and: [ r minor = aMinor ] ] ]
		ifFound: [ :r | ^ r ]
		ifNone: [
			[
			(handle propertyNamed: #References)
				dispatch: #AddFromFile
				withArguments: { aFileReference fullName } ]
				on: Error
				do: [ :e |
					(handle propertyNamed: #References)
						dispatch: #AddFromGuid
						withArguments: {
								aGuid.
								aMajor.
								aMinor } ].
			^ self references detect: [ :r | r name = aName ] ]
]

{ #category : #'convenience-fst-class-citizen' }
JinAccessApplication >> close: aJinModelObject [

	<doc:
	'Closes a given first class citizen (Form, Class, etc) without saving, therfore losing all modification'>
	self close: aJinModelObject save: false
]

{ #category : #'convenience-fst-class-citizen' }
JinAccessApplication >> close: aJinModelObject save: aBool [
	<doc:
	'Closes a given first class citizen (Form, Class, etc). It saves or not accordign to the :save: parameter.'>
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

{ #category : #'convenience-fst-class-citizen' }
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
	<doc: 'Closes the currently opened project.'>
	[ self handle dispatch: 'CloseCurrentDatabase' withArguments: {  } ]
		on: Error
		do: [ :e |  ]
]

{ #category : #convenience }
JinAccessApplication >> command [

	^ handle propertyNamed: #DoCmd
]

{ #category : #convenience }
JinAccessApplication >> command: aString withArguments: aCollection [

	<doc:
	'DoCmd. (Do Command) is an object that reifies most of the available operations to apply on the application. It must be used for opening a project, databases and others. Most of the objects below have this object as a dependency.'>
	^ self command dispatch: aString withArguments: aCollection
]

{ #category : #commands }
JinAccessApplication >> compileAll [

	<doc:
	'Runs command acCmdCompileAllModules 	125. This is equivalent to click on the Microsoft Access "Compile All" menu.  It forces the compilation of all the modules'>
	self command: #RunCommand withArguments: { 125 }
]

{ #category : #'form-api' }
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

{ #category : #'form-api' }
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

{ #category : #'report-api' }
JinAccessApplication >> createControl: aName inReport: aJinReport type: aTypeNumber section: aSection [
	| control |
	control := handle
		dispatch: #CreateReportControl
		withArguments:
			{aJinReport name.
			aTypeNumber .aSection }.
	control propertyNamed: #Name put: aName
]

{ #category : #'form-api' }
JinAccessApplication >> createForm [
	<doc: '[https://learn.microsoft.com/en-us/office/vba/api/access.application.createform](https://learn.microsoft.com/en-us/office/vba/api/access.application.createform) 
	
Use the CreateForm method when designing a wizard that creates a new NAMELESS form.
The CreateForm method opens a new, minimized form in form Design view.
If the name that you use for the FormTemplate argument isn''t valid, Visual Basic uses the form template specified by the Form Template setting on the Forms/Reports tab of the Options dialog box.'>
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

{ #category : #'form-api' }
JinAccessApplication >> createFormNamed: aString [
	<doc: '[https://learn.microsoft.com/en-us/office/vba/api/access.application.createform](https://learn.microsoft.com/en-us/office/vba/api/access.application.createform) 	
Use the CreateForm method when designing a wizard that creates a new form.
The CreateForm method opens a new, minimized form in form Design view.
If the name that you use for the FormTemplate argument isn''t valid, Visual Basic uses the form template specified by the Form Template setting on the Forms/Reports tab of the Options dialog box.'>
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

{ #category : #'report-api' }
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

{ #category : #'module-api' }
JinAccessApplication >> createModule: aKind named: aName properties: aCollection into: aProject [

	| f |
	f := self
		     ensureFileModuleKind: aKind
		     name: aName
		     properties: aCollection.



	handle dispatch: #LoadFromText withArguments: {
			JinModule typeNumber.
			aName.
			f fullName }.
	f delete
]

{ #category : #'project-api' }
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

{ #category : #'report-api' }
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

{ #category : #'report-api' }
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

{ #category : #'module-api' }
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

{ #category : #'form-api' }
JinAccessApplication >> ensureNonOtherFormtIsOpen [

	<doc: 'Closes any active form'>
	[
	self
		close: (self activeForm propertyNamed: #Name)
		type: JinForm typeNumber
		save: false ]
		on: Error
		do: [ :e |  ]
]

{ #category : #'report-api' }
JinAccessApplication >> ensureNonOtherReportIsOpen [
	[ self
		close: (self activeReport propertyNamed: #Name)
		type: JinReport typeNumber
		save: false ]
		on: Error
		do: [ :e |  ]
]

{ #category : #'convenience-fst-class-citizen' }
JinAccessApplication >> export: aJinModelObject toFolder: aFileReference [

	<doc:
	'Saves a given first class citizen as text. This is a nondocumented feature. We encourage not using it. This command does not work with tables or queries.'>
	| destination |
	destination := aFileReference / aJinModelObject name
	               ,
	               (aJinModelObject class name
		                copyReplaceAll: 'Jin'
		                with: '').
	handle dispatch: #SaveAsText withArguments: {
			aJinModelObject typeNumber.
			aJinModelObject name.
			destination fullName }
]

{ #category : #'convenience-fst-class-citizen' }
JinAccessApplication >> exportXml: aJinModelObject toFolder: aFileReference [
	| destination xsd |
	<doc:
	'Saves a given first class citizen as XML. It works only with queries and tables'>
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

	<doc:
	'Opens a given project with Microsoft Access, creates a new project object'>
	self handle
		dispatch: 'OpenCurrentDatabase'
		withArguments: { aFileReference fullName }.
	^ JinAccessProject new
		  handle: (handle propertyNamed: 'CurrentProject')
		  dataHandle: (handle propertyNamed: #CurrentData)
		  application: self;
		  projectPath: aFileReference;
		  yourself
]

{ #category : #initialization }
JinAccessApplication >> open: aFileReference into: aProject [

	<doc: 'Opens a given project with Microsoft Access, using a given project object'>
	self handle
		dispatch: 'OpenCurrentDatabase'
		withArguments: { aFileReference fullName }.
	^ aProject
		  handle: (handle propertyNamed: 'CurrentProject')
		  dataHandle: (handle propertyNamed: #CurrentData)
		  application: self;
		  projectPath: aFileReference;
		  yourself
]

{ #category : #'form-api' }
JinAccessApplication >> openForm: aJinForm [
	<doc: '[https://learn.microsoft.com/en-us/office/vba/api/access.docmd.openform](https://learn.microsoft.com/en-us/office/vba/api/access.docmd.openform)
	Open a given form in edition mode'>
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
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinFormBody ;
				yourself)
]

{ #category : #'module-api' }
JinAccessApplication >> openedModuleHandles [
^ JinCollection newDefault
		handle: (handle propertyNamed: #Modules)
		factory:
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinModuleBody  ;
				yourself)
	
]

{ #category : #'query-api' }
JinAccessApplication >> openedQueryHandles [
	^ JinCollection newDefault
		handle: (self database propertyNamed: #QueryDefs)
		factory:
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinQueryBody;
				yourself)
]

{ #category : #'report-api' }
JinAccessApplication >> openedReportHandles [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Reports)
		factory:
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinReportBody ;
				yourself)
]

{ #category : #'table-api' }
JinAccessApplication >> openedTableHandles [
	^ JinCollection newDefault
		handle: (self database propertyNamed: #TableDefs)
		factory:
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinTableBody;
				yourself)
]

{ #category : #'application-api' }
JinAccessApplication >> quit [

	<doc: 'Quits the instance of Microsoft Access'>
	[
	[ handle dispatch: #Quit ]
		on: Error
		do: [ :e |  ] ] ensure: [ handle := nil ]
]

{ #category : #accessing }
JinAccessApplication >> references [
	^ JinCollection newDefaultForMethod
		handle: (handle propertyNamed: #References)
		factory:
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinReference;
				yourself)
]

{ #category : #convenience }
JinAccessApplication >> refreshDatabaseWindow [

	<doc:
	'[https://learn.microsoft.com/en-us/office/vba/api/access.application.refreshdatabasewindow](https://learn.microsoft.com/en-us/office/vba/api/access.application.refreshdatabasewindow) The RefreshDatabaseWindow method updates the Database window after a database object has been created, deleted, or renamed.'>
	handle dispatch: #RefreshDatabaseWindow
]

{ #category : #'convenience-fst-class-citizen' }
JinAccessApplication >> rename: aName typeNumber: aNumber with: aNewName [
	self
		command: #Rename
		withArguments:
			{aNewName.
			aNumber.
			aName}
]

{ #category : #'convenience-fst-class-citizen' }
JinAccessApplication >> rename: anObject with: aName [

	<doc: 'Renames a given first class citizen with a given name'>
	self
		rename: anObject name
		typeNumber: anObject typeNumber
		with: aName
]

{ #category : #initialization }
JinAccessApplication >> reopen: aFileReference into: aProject [

	<doc:
	'Tries to close the opened project and application, to open it again. '>
	[ aProject close ]
		on: Error
		do: [ :e |  ].
	[ self quit ]
		on: Error
		do: [ :e |  ].
	self open: aFileReference into: aProject
]

{ #category : #'application-api' }
JinAccessApplication >> save: aJinModelObject [

	<doc: 'Saves a given object. Form, Report, Module, etc'>
	self command: #Save withArguments: {
			aJinModelObject typeNumber.
			aJinModelObject name }
]

{ #category : #'module-api' }
JinAccessApplication >> saveModuleNamed: aString [
	self
		command: #Save
		withArguments:
			{JinModule typeNumber.
			aString}
]

{ #category : #'convenience-fst-class-citizen' }
JinAccessApplication >> vbeComponentFor: aJinModule in: aJinAccessProject [
	^ (self vbeProjectFor: aJinAccessProject) components
		detect: [ :c | c name = aJinModule vbeComponentName ]
]

{ #category : #'project-api' }
JinAccessApplication >> vbeProjectFor: aJinAccessProject [

	<doc:
	'Obtains the VB Project related to a given Access Module(project)'>
	^ self vbeProjects
		  detect: [ :p | p sanitizedName = aJinAccessProject sanitizedName ]
		  ifNone: [
			  self vbeProjects size = 1
				  ifTrue: [ self vbeProjects first ]
				  ifFalse: [
					  self vbeProjects
						  detect: [ :p |
						  p sanitizedName beginsWith: aJinAccessProject sanitizedName ]
						  ifNone: [
							  self vbeProjects size = 1
								  ifTrue: [ self vbeProjects first ]
								  ifFalse: [ self error: 'Cannot find VB related project ' ] ] ] ]
]

{ #category : #'application-api' }
JinAccessApplication >> vbeProjects [
	<doc:'Use the VBProjects collection to access the collection of projects (Access modules) of the related VBEnvironment. The VBE property of the Application object represents the Microsoft Visual Basic for Applications editor. '>
	^ JinCollection newDefaultForMethod
		handle: ((handle propertyNamed: #VBE) propertyNamed: #VBProjects)
		factory:
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinVBEProject;
				yourself)
]

{ #category : #initialization }
JinAccessApplication >> visible [
	^ visible ifNil: [ true ]
]

{ #category : #initialization }
JinAccessApplication >> visible: aBoolean [

	<doc: 'Turns visible or invisible the instance of Microsoft Access'>
	visible := aBoolean.
	handle ifNotNil: [ handle propertyNamed: #Visible put: aBoolean ]
]

{ #category : #'table-api' }
JinAccessApplication >> workspace [
	^ ((handle propertyNamed: #DBEngine) propertyNamed:#Workspaces ) propertyNamed:#Item withArguments:{0}.
]
