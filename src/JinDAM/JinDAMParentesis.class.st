Class {
	#name : #JinDAMParentesis,
	#superclass : #JinDAMEntity,
	#instVars : [
		'expression'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMParentesis >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitParenthesis: self
]

{ #category : #accessing }
JinDAMParentesis >> expression [
	^ expression
]

{ #category : #accessing }
JinDAMParentesis >> expression: aJinDAMBinaryOperation [ 
	expression := aJinDAMBinaryOperation
]
