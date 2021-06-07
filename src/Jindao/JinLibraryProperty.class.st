Class {
	#name : #JinLibraryProperty,
	#superclass : #JinLibraryAttribute,
	#instVars : [
		'setter',
		'getter'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryProperty >> acceptVisitor: aVisitor [

	aVisitor visitLibraryProperty: self
]

{ #category : #accessing }
JinLibraryProperty >> getter [

	^ getter
]

{ #category : #acecessing }
JinLibraryProperty >> getter: aJinLibraryMethod [ 
	getter := aJinLibraryMethod
]

{ #category : #accessing }
JinLibraryProperty >> printOn: aStream [

	aStream
		nextPutAll: typeName asString ;
		nextPutAll: ' ';
		nextPutAll: (owner ifNil: [ '...' ] ifNotNil: [ owner name ]);
		nextPutAll: '::';
		nextPutAll: name
]

{ #category : #accessing }
JinLibraryProperty >> setter [

	^ setter
]

{ #category : #accessing }
JinLibraryProperty >> setter: anUndefinedObject [ 
	setter := anUndefinedObject
]
