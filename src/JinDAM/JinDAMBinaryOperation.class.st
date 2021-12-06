Class {
	#name : #JinDAMBinaryOperation,
	#superclass : #JinDAMEntity,
	#instVars : [
		'left',
		'operator',
		'right'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMBinaryOperation >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitBinaryOperation: self
]

{ #category : #accessing }
JinDAMBinaryOperation >> left: aJinDAMAccessRead [ 
	left := aJinDAMAccessRead
]

{ #category : #generated }
JinDAMBinaryOperation >> operator: aString [

	operator := aString asSymbol
]

{ #category : #accessing }
JinDAMBinaryOperation >> right: anExpression [ 
	right := anExpression
]
