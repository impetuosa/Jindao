Class {
	#name : #JinLibraryEnum,
	#superclass : #JinLibraryType,
	#instVars : [
		'values'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibraryEnum >> printOn: aStream [

	aStream
		nextPutAll: 'Enum(';
		nextPutAll: name;
		nextPut: $#;
		nextPutAll: values size asString ;
		nextPut: $)
]

{ #category : #accessing }
JinLibraryEnum >> values: aCollection [ 
	values := aCollection
]
