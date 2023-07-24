"
I represent a Function defined in the library
"
Class {
	#name : #JinLibraryFunction,
	#superclass : #JinLibraryElement,
	#instVars : [
		'selector'
	],
	#category : #'Jindao-MSAccess-Library'
}

{ #category : #visiting }
JinLibraryFunction >> acceptVisitor: aVisitor [

	aVisitor visitLibraryFunction: self
]

{ #category : #testing }
JinLibraryFunction >> isReferredBySymbol: aJinNSNameEntry [
 
	^ aJinNSNameEntry kind isInvocable and: [ 
		  (aJinNSNameEntry referersTo: self selector) or: [ 
			  aJinNSNameEntry referersTo: self loadableSelector ] ]
]

{ #category : #testing }
JinLibraryFunction >> loadableSelector [

	^ ('_' split: self selector) last
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
