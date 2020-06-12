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
JinFormBody >> controls [
	^ controls
		ifNil: [ controls := JinCollection newDefault
				handle: (handle propertyNamed: #Controls)
				factory: self controlsFactory ]
]

{ #category : #'as yet unclassified' }
JinFormBody >> controlsFactory [
	^ JinRemotesFactory newDefaultControlsFactory
		parent: self;
		yourself
]

{ #category : #'as yet unclassified' }
JinFormBody >> hasModule [
	^ handle propertyNamed: #HasModule
]

{ #category : #'as yet unclassified' }
JinFormBody >> module [
	^ module
		ifNil: [ module := JinSubModuleBody new
				handle: (handle propertyNamed: #Module);
				yourself ]
]
