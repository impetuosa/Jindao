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
	#superclass : #Object,
	#instVars : [
		'handle',
		'visible',
		'references'
	],
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinAccessApplication class >> default [
	^ self new
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> acceptVisitor: aVisitor [
	aVisitor visitApplication: self 
]

{ #category : #initialization }
JinAccessApplication >> closeProject: aProject [
	self handle dispatch: 'CloseCurrentDatabase' withArguments: {}
]

{ #category : #accessing }
JinAccessApplication >> command [
	^ handle propertyNamed: #DoCmd
]

{ #category : #convenience }
JinAccessApplication >> command: aString withArguments: aCollection [ 
	^ self command dispatch: aString withArguments: aCollection 
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

{ #category : #'as yet unclassified' }
JinAccessApplication >> openForm: aJinForm [ 
	self command: #OpenForm withArguments: {aJinForm name}.
	^ self openedFormsHandles detect: [ :m | m name = aJinForm name ]
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> openModule: aJinModule [
	self command: #OpenModule withArguments: {aJinModule name}.
	^ self openedModuleHandles detect: [ :m | m name = aJinModule name ]
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> openQuery: aJinQuery [
	self command: #OpenQuery withArguments: {aJinQuery name}
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> openReport: aJinReport [ 
	self command: #OpenReport withArguments: {aJinReport name}.
	^ self openedReportHandles detect: [ :m | m name = aJinReport name ]
]

{ #category : #accessing }
JinAccessApplication >> openedFormsHandles [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Forms)
		factory: (JinInstanceFactory defaultFor: JinHandleObject)
]

{ #category : #accessing }
JinAccessApplication >> openedModuleHandles [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Modules)
		factory: (JinInstanceFactory defaultFor: JinHandleObject)
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> openedReportHandles [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Reports)
		factory: (JinInstanceFactory defaultFor: JinReport)
]

{ #category : #'as yet unclassified' }
JinAccessApplication >> references [
	^ references
		ifNil: [ references := JinCollection newDefaultForMethod
				handle: (handle propertyNamed: #References)
				factory:
					((JinInstanceFactory defaultFor: JinReference)
						project: self;
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
