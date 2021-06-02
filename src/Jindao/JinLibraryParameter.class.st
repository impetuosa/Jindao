Class {
	#name : #JinLibraryParameter,
	#superclass : #JinLibraryAttribute,
	#instVars : [
		'isOptional'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibraryParameter >> isOptional: aBoolean [ 
	isOptional := aBoolean
]

{ #category : #accessing }
JinLibraryParameter >> printOn: aStream [

	isOptional ifTrue: [ aStream nextPutAll: '[OPT] ' ].
	aStream
		nextPutAll: typeName;
		nextPutAll: ' ';
		nextPutAll: name
]
