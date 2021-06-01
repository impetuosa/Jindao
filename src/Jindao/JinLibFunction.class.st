Class {
	#name : #JinLibFunction,
	#superclass : #Object,
	#instVars : [
		'library',
		'selector'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibFunction >> library: aJinLibrary [ 
	library := aJinLibrary
]

{ #category : #accessing }
JinLibFunction >> printOn: aStream [
	aStream nextPutAll: library name; nextPutAll:'::'; nextPutAll: selector; nextPutAll:'(...)'.
]

{ #category : #accesisng }
JinLibFunction >> selector: aString [ 
	selector := aString
]
