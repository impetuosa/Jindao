Class {
	#name : #JinLibraryMethod,
	#superclass : #JinLibraryFunction,
	#instVars : [
		'parameters',
		'returnTypeName'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryMethod >> accept: aVisitor [
	^ aVisitor visitMethod: self.

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
		nextPutAll: owner name;
		nextPutAll: '::';
		nextPutAll: selector;
		nextPut: $(.

	parameters do: [ :p | p printOn: aStream ].
	aStream nextPut: $)
]

{ #category : #accessing }
JinLibraryMethod >> returnTypeName: aString [

	returnTypeName := aString
]
