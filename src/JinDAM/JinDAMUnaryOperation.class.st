Class {
	#name : #JinDAMUnaryOperation,
	#superclass : #JinDAMEntity,
	#instVars : [
		'operator',
		'operand',
		'order'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMUnaryOperation >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitUnaryOperation: self
]

{ #category : #accessing }
JinDAMUnaryOperation >> operand: aCollection [ 
	operand := aCollection
]

{ #category : #accessing }
JinDAMUnaryOperation >> operator: aString [ 
	operator := aString
]

{ #category : #initialization }
JinDAMUnaryOperation >> setAsPostfix [
	" the operator is on the right of the operand: 1! (factorial) "
	 order := #postfix
]

{ #category : #initialization }
JinDAMUnaryOperation >> setAsPrefix [

	" the operator is on the left of the operand: !1 (not 1) "

	order := #prefix
]
