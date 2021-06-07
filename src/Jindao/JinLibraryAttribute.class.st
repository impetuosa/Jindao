Class {
	#name : #JinLibraryAttribute,
	#superclass : #JinLibraryElement,
	#instVars : [
		'typeName',
		'name'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryAttribute >> acceptVisitor: aVisitor [
 aVisitor visitLibraryAttribute: self.

]

{ #category : #testing }
JinLibraryAttribute >> isConstant [
	^ false 
]

{ #category : #accessing }
JinLibraryAttribute >> name [

	^ name
]

{ #category : #accessing }
JinLibraryAttribute >> name: anObject [

	name := anObject
]

{ #category : #accessing }
JinLibraryAttribute >> type [
	^ typeName
]

{ #category : #accessing }
JinLibraryAttribute >> typeName: aString [ 
	typeName := aString
]
