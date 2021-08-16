Class {
	#name : #JinDAMVariableReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'name',
		'type',
		'arguments'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMVariableReference >> name: aString [ 
	name := aString
]
