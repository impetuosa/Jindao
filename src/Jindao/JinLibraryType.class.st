Class {
	#name : #JinLibraryType,
	#superclass : #JinLibraryElement,
	#instVars : [
		'name'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryType >> accept: aVisitor [
	^ aVisitor visitType: self.

]

{ #category : #accessing }
JinLibraryType >> name [

	^ name
]

{ #category : #accessing }
JinLibraryType >> name: aString [ 
	name := aString
]
