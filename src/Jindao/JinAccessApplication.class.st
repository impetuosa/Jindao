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

{ #category : #'table-api' }
JinAccessApplication >> database [
	^ (self workspace propertyNamed: #Databases) propertyNamed:#Item withArguments:{0}
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
		yourself
]

{ #category : #'form-api' }
JinAccessApplication >> openForm: aJinForm [ 
	self command: #OpenForm withArguments: {aJinForm name . 1}.
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
	| wsp |
	wsp := self workspace.
	self
		command: #OpenTable
		withArguments:
			{aJinTable name.
			1}.
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
		handle: (handle propertyNamed: #Queries)
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

{ #category : #accessing }
JinAccessApplication >> references [
	^ references
		ifNil: [ references := JinCollection newDefaultForMethod
				handle: (handle propertyNamed: #References)
				factory:
					(JinRemoteObjectOnlyGenericsFactory new
						defaultHierarchyClass: JinReference;
						yourself) ]
]

{ #category : #initialization }
JinAccessApplication >> visible [
	^ visible ifNil: [ true ]
]

{ #category : #initialization }
JinAccessApplication >> visible: aBoolean [
	visible := aBoolean 
]

{ #category : #'table-api' }
JinAccessApplication >> workspace [
	^ ((handle propertyNamed: #DBEngine) propertyNamed:#Workspaces ) propertyNamed:#Item withArguments:{0}.
]
