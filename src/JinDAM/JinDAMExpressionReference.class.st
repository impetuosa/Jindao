Class {
	#name : #JinDAMExpressionReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'arguments'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMExpressionReference >> accept: aVisitor [  
	^ aVisitor visitExpressionReference: self.

]

{ #category : #adding }
JinDAMExpressionReference >> addArgument: aJinDAMArgument [ 
	 self arguments add: aJinDAMArgument
]

{ #category : #adding }
JinDAMExpressionReference >> arguments [
	^ arguments ifNil: [ arguments := OrderedCollection new  ]
]

{ #category : #accessing }
JinDAMExpressionReference >> name [
	 ^ ' '
]
