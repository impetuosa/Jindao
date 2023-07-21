Class {
	#name : #JinLibraryType,
	#superclass : #JinLibraryElement,
	#instVars : [
		'name'
	],
	#category : #'Jindao-DLL-Library'
}

{ #category : #'as yet unclassified' }
JinLibraryType >> acceptVisitor: aVisitor [

	^ aVisitor visitLibraryType: self
]

{ #category : #accessing }
JinLibraryType >> definitions [  
	^ self subclassResponsibility 
]

{ #category : #testing }
JinLibraryType >> isReferredBySymbol: aSymbol [

	^ aSymbol kind isType and: [ aSymbol referersTo: self name ]
]

{ #category : #accessing }
JinLibraryType >> name [

	^ name
]

{ #category : #accessing }
JinLibraryType >> name: aString [ 
	name := aString
]
