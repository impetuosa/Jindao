Class {
	#name : #JinControl,
	#superclass : #Object,
	#instVars : [
		'handle',
		'parent'
	],
	#category : #'Jindao-Factories'
}

{ #category : #'as yet unclassified' }
JinControl class >> mappedTypeName [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
JinControl >> handle: aCOMDispatchInstance [ 
	handle := aCOMDispatchInstance
]

{ #category : #'as yet unclassified' }
JinControl >> parent: aParent [ 
	parent := aParent 
]
