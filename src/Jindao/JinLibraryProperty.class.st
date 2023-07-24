"
I represent a Property defined in the library. 
Note that properties are like in C#/VB.net, etc. A mashup of memory holding plus setting/getting attached functions.
"
Class {
	#name : #JinLibraryProperty,
	#superclass : #JinLibraryAttribute,
	#instVars : [
		'setter',
		'getter'
	],
	#category : #'Jindao-MSAccess-Library'
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
