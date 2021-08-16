Class {
	#name : #JinDAMAccessWrite,
	#superclass : #JinDAMAccessRead,
	#instVars : [
		'writeReference',
		'isReturn',
		'isNewObject'
	],
	#category : #'JinDAM-Model'
}

{ #category : #testing }
JinDAMAccessWrite >> isNewObject: aBoolean [

	isNewObject := aBoolean
]

{ #category : #testing }
JinDAMAccessWrite >> isReturn: aBoolean [

	isReturn := aBoolean
]

{ #category : #accessing }
JinDAMAccessWrite >> writeReference: aJinDAMVariableReference [ 
	writeReference := aJinDAMVariableReference
]
