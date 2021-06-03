Class {
	#name : #JinLibraryProperty,
	#superclass : #JinLibraryAttribute,
	#instVars : [
		'setter',
		'getter'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryProperty >> accept: aVisitor [
	^ aVisitor visitProperty: self.

]

{ #category : #acecessing }
JinLibraryProperty >> getter: aJinLibraryMethod [ 
	getter := aJinLibraryMethod
]

{ #category : #accessing }
JinLibraryProperty >> setter: anUndefinedObject [ 
	setter := anUndefinedObject
]
