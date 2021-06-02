Class {
	#name : #JinLibFunction,
	#superclass : #JinLibraryElement,
	#instVars : [
		'selector'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibFunction >> printOn: aStream [
	aStream nextPutAll: owner name; nextPutAll:'::'; nextPutAll: selector; nextPutAll:'(...)'.
]

{ #category : #accessing }
JinLibFunction >> selector [
	^ selector
]

{ #category : #accesisng }
JinLibFunction >> selector: aString [ 
	selector := aString
]
