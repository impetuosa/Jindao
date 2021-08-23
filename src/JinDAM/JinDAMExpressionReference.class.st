Class {
	#name : #JinDAMExpressionReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'arguments'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMExpressionReference >> addArgument: aJinDAMArgument [ 
	 self arguments add: aJinDAMArgument
]

{ #category : #adding }
JinDAMExpressionReference >> arguments [
	^ arguments ifNil: [ arguments := OrderedCollection new  ]
]
