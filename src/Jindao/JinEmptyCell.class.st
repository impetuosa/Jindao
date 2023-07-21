"
Enitty produced by access with the only reason of layout adjustment. 
"
Class {
	#name : #JinEmptyCell,
	#superclass : #JinControlGeneric,
	#category : #'Jindao-MSAccess-Widgets-Builtin-Controls'
}

{ #category : #'as yet unclassified' }
JinEmptyCell class >> mappedTypeName [
	^#'_EmptyCell'
]

{ #category : #testing }
JinEmptyCell >> isCustomControl [
	^ false
]

{ #category : #testing }
JinEmptyCell >> isEmptyCell [
	^ true 
]
