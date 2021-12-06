Class {
	#name : #JinDAMBehavioural,
	#superclass : #JinDAMInvocable,
	#instVars : [
		'localVariables',
		'accesses',
		'block'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMBehavioural >> accept: aVisitor [  
	^ aVisitor visitBehavioural: self.

]

{ #category : #adding }
JinDAMBehavioural >> accesses [

	^ accesses ifNil: [ accesses := OrderedCollection new ]
]

{ #category : #adding }
JinDAMBehavioural >> addAccess: aJinDAMAccessRead [ 
	self accesses add: aJinDAMAccessRead 
]

{ #category : #adding }
JinDAMBehavioural >> addLocalVariable: aJinDAMLocalVariable [

	self localVariables add: aJinDAMLocalVariable
]

{ #category : #generated }
JinDAMBehavioural >> block: aJinDAMBlock [ 
	block := aJinDAMBlock 
]

{ #category : #testing }
JinDAMBehavioural >> find: aJinNSKind named: aString [

	| lc |
	lc := aString asLowercase.
	aJinNSKind isAttribute ifTrue: [ 
		^ self localVariablesDetect: [ :p | p name asLowercase = lc ]
			  ifNone: [ parameters detect: [ :p | p name asLowercase = lc ] ] ].
	self error: '???'
]

{ #category : #accessing }
JinDAMBehavioural >> localVariables [
	^ localVariables ifNil: [ localVariables := OrderedCollection new  ]
]

{ #category : #enumerating }
JinDAMBehavioural >> localVariablesDetect: aFullBlockClosure ifNone: aFullBlockClosure2 [ 
	localVariables ifNil: [ ^ aFullBlockClosure2 value ].
	^ localVariables detect: aFullBlockClosure ifNone: aFullBlockClosure2 
]
