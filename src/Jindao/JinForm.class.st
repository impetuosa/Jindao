"
I do represent a Form. A form contains controls and oftenly a related module with the related code. 
"
Class {
	#name : #JinForm,
	#superclass : #JinHandleObject,
	#instVars : [
		'code',
		'module',
		'controls'
	],
	#category : #'Jindao-DomainObjects-PrincipalObjects'
}

{ #category : #'as yet unclassified' }
JinForm >> acceptVisitor: aVisitor [
	aVisitor visitForm: self.
	
]

{ #category : #'as yet unclassified' }
JinForm >> code [
	^ self module code 
]

{ #category : #'as yet unclassified' }
JinForm >> controls [
	self ensureIsLoaded.
	^ controls
		ifNil: [ controls := JinCollection newDefault
				handle: (loadedObjectHandle propertyNamed: #Controls)
				factory: self controlsFactory ]
]

{ #category : #'as yet unclassified' }
JinForm >> controlsFactory [
	^ JinRemotesFactory newDefaultControlsFactory
		parent: self;
		yourself
]

{ #category : #'as yet unclassified' }
JinForm >> hasModule [
	self ensureIsLoaded .
	^ loadedObjectHandle propertyNamed: #HasModule
]

{ #category : #'as yet unclassified' }
JinForm >> module [
	self ensureIsLoaded.
	^ module
		ifNil: [ module := JinFormModule new
				moduleHandle: (loadedObjectHandle propertyNamed: #Module) project: project;
				yourself ]
]

{ #category : #'as yet unclassified' }
JinForm >> privateLoadObjectHandle [
	^ (project openForm: self) handle
]
