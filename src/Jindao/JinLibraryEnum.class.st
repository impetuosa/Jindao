Class {
	#name : #JinLibraryEnum,
	#superclass : #JinLibraryType,
	#instVars : [
		'values'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryEnum >> accept: aVisitor [
	^ aVisitor visitEnum: self.

]

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
