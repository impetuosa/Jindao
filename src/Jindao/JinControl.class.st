Class {
	#name : #JinControl,
	#superclass : #Object,
	#instVars : [
		'handle',
		'parent'
	],
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinControl class >> mappedTypeName [
	^ false 
]

{ #category : #'as yet unclassified' }
JinControl >> acceptVisitor: aVisitor [
	aVisitor visitControl: self
]

{ #category : #'as yet unclassified' }
JinControl >> handle: aCOMDispatchInstance [ 
	handle := aCOMDispatchInstance
]

{ #category : #'as yet unclassified' }
JinControl >> parent: aParent [ 
	parent := aParent 
]
