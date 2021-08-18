Class {
	#name : #JinDAMBehavioural,
	#superclass : #JinDAMInvocable,
	#instVars : [
		'localVariables',
		'accesses'
	],
	#category : #'JinDAM-Model'
}

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

{ #category : #accessing }
JinDAMBehavioural >> localVariables [
	^ localVariables ifNil: [ localVariables := OrderedCollection new  ]
]
