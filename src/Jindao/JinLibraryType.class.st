Class {
	#name : #JinLibraryType,
	#superclass : #JinLibraryElement,
	#instVars : [
		'name'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryType >> acceptVisitor: aVisitor [

	^ aVisitor visitLibraryType: self
]

{ #category : #accessing }
JinLibraryType >> definitions [  
	^ self subclassResponsibility 
]

{ #category : #accessing }
JinLibraryType >> name [

	^ name
]

{ #category : #accessing }
JinLibraryType >> name: aString [ 
	name := aString
]
