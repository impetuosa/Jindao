Class {
	#name : #JinDAMTypeReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'typeName'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMTypeReference >> typeName [

	^ typeName
]

{ #category : #accessing }
JinDAMTypeReference >> typeName: aString [ 
	typeName := aString
]
