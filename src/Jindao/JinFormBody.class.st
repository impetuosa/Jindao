"
I do represent a Form. A form contains controls and oftenly a related module with the related code. 
"
Class {
	#name : #JinFormBody,
	#superclass : #JinBodyObject,
	#instVars : [
		'code',
		'module',
		'controls'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinFormBody >> code [
	^ self module code 
]

{ #category : #'as yet unclassified' }
JinFormBody >> componentKnownProperties [
	^ JinForm componentKnownProperties
]

{ #category : #'as yet unclassified' }
JinFormBody >> controls [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Controls)
		factory: self controlsFactory
]

{ #category : #'as yet unclassified' }
JinFormBody >> controlsFactory [
	^ JinRemotesFactory newDefaultControlsFactory
		scopedBy: self;
		yourself
]

{ #category : #'as yet unclassified' }
JinFormBody >> hasHeaderFooter [
	"
1 	acHeader 	Form header section
2 	acFooter 	Form footer section"
	^ self hasSection: 1.
	
]

{ #category : #'as yet unclassified' }
JinFormBody >> hasModule [
	^ handle propertyNamed: #HasModule
]

{ #category : #'as yet unclassified' }
JinFormBody >> hasModule: aValue [
	^ handle propertyNamed: #HasModule put: aValue
]

{ #category : #'as yet unclassified' }
JinFormBody >> hasPageHeaderFooter [
	"3 	acPageHeader 	Form page header section
4 	acPageFooter 	Form page footer section"

	^ self hasSection: 3
]

{ #category : #'as yet unclassified' }
JinFormBody >> hasSection: anInteger [
	^ [ (handle propertyNamed: #Section withArguments: {anInteger})
		propertyNamed: #Name.
	true ]
		on: Win32Error
		do: [ :e | 
			e passIfNotError0x80020009.
			false ]
]

{ #category : #'as yet unclassified' }
JinFormBody >> height [
	^ (handle propertyNamed: #Section withArguments: {0})
		propertyNamed: #Height
]

{ #category : #'as yet unclassified' }
JinFormBody >> height: anInteger [
	^ (handle propertyNamed: #Section withArguments: {0})
		propertyNamed: #Height
		put: anInteger
]

{ #category : #'as yet unclassified' }
JinFormBody >> left [
	^ handle propertyNamed: 'WindowLeft'
]

{ #category : #'as yet unclassified' }
JinFormBody >> module [
	^ module
		ifNil: [ module := JinSubModuleBody new
				handle: (handle propertyNamed: #Module);
				yourself ]
]

{ #category : #'as yet unclassified' }
JinFormBody >> resolveObjectFor: aHandle [
	| name |
	name := aHandle propertyNamed: #Name.
	^ self name = name
		ifTrue: [ self ]
		ifFalse: [ self controls detect: [ :c | c name = name ] ]
]

{ #category : #'as yet unclassified' }
JinFormBody >> right [
	^ handle propertyNamed: 'WindowRight'
]

{ #category : #'as yet unclassified' }
JinFormBody >> top [
	^ handle propertyNamed: 'WindowTop'
]

{ #category : #'as yet unclassified' }
JinFormBody >> width [
	^ handle propertyNamed:#Width
]

{ #category : #'as yet unclassified' }
JinFormBody >> width: anInteger [ 
	handle propertyNamed:#Width put: anInteger 
]
