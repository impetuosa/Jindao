Class {
	#name : #JinLibraryEnum,
	#superclass : #JinLibraryType,
	#instVars : [
		'values'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryEnum >> acceptVisitor: aVisitor [
 aVisitor visitLibraryEnum: self.

]

{ #category : #accessing }
JinLibraryEnum >> definitions [
	 ^ values 
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
JinLibraryEnum >> values [
	^ values
]

{ #category : #accessing }
JinLibraryEnum >> values: aCollection [ 
	values := aCollection
]
