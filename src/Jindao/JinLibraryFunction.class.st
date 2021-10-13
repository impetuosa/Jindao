Class {
	#name : #JinLibraryFunction,
	#superclass : #JinLibraryElement,
	#instVars : [
		'selector'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #visiting }
JinLibraryFunction >> acceptVisitor: aVisitor [

	aVisitor visitLibraryFunction: self
]

{ #category : #accessing }
JinLibraryFunction >> printOn: aStream [
	aStream nextPutAll: owner name; nextPutAll:'::'; nextPutAll: selector; nextPutAll:'(...)'.
]

{ #category : #accessing }
JinLibraryFunction >> selector [
	^ selector
]

{ #category : #accesisng }
JinLibraryFunction >> selector: aString [ 
	selector := aString
]
