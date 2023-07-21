"
I represent a parameter in a function defined in the library
"
Class {
	#name : #JinLibraryParameter,
	#superclass : #JinLibraryAttribute,
	#instVars : [
		'isOptional'
	],
	#category : #'Jindao-DLL-Library'
}

{ #category : #'as yet unclassified' }
JinLibraryParameter >> acceptVisitor: aVisitor [

	aVisitor visitLibraryParameter: self
]

{ #category : #accessing }
JinLibraryParameter >> isOptional [

	^ isOptional
]

{ #category : #accessing }
JinLibraryParameter >> isOptional: aBoolean [ 
	isOptional := aBoolean
]

{ #category : #accessing }
JinLibraryParameter >> printOn: aStream [

	self isOptional ifTrue: [ aStream nextPutAll: '[OPT] ' ].
	aStream
		nextPutAll: typeName;
		nextPutAll: ' ';
		nextPutAll: name
]
