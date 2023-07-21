"
I represent a METHOD defined in the library
"
Class {
	#name : #JinLibraryMethod,
	#superclass : #JinLibraryFunction,
	#instVars : [
		'parameters',
		'returnTypeName'
	],
	#category : #'Jindao-DLL-Library'
}

{ #category : #'as yet unclassified' }
JinLibraryMethod >> acceptVisitor: aVisitor [

	^ aVisitor visitLibraryMethod: self
]

{ #category : #accessing }
JinLibraryMethod >> name [
	^ selector 
]

{ #category : #accessing }
JinLibraryMethod >> parameters [
	^ parameters
]

{ #category : #accessing }
JinLibraryMethod >> parameters: aCollectionOfParameters [

	parameters := aCollectionOfParameters.
	aCollectionOfParameters do: [ :a | a owner: self ]
]

{ #category : #accessing }
JinLibraryMethod >> printOn: aStream [

	aStream
		nextPutAll: returnTypeName;
		nextPutAll: ' ';
		nextPutAll: (owner ifNil: [ '...' ] ifNotNil: [ owner name ]);
		nextPutAll: '::';
		nextPutAll: selector;
		nextPut: $(.

	parameters do: [ :p | p printOn: aStream ].
	aStream nextPut: $)
]

{ #category : #accessing }
JinLibraryMethod >> returnTypeName [
	^ returnTypeName
]

{ #category : #accessing }
JinLibraryMethod >> returnTypeName: aString [

	returnTypeName := aString
]

{ #category : #accessing }
JinLibraryMethod >> type [
	^ returnTypeName 
]
