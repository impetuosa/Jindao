Class {
	#name : #JinLibraryMethod,
	#superclass : #JinLibFunction,
	#instVars : [
		'parameters',
		'returnTypeName'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibraryMethod >> parameters: aCollectionOfParameters [ 
	parameters := aCollectionOfParameters 
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
