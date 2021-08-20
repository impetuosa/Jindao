Class {
	#name : #JinDAMExternalFunction,
	#superclass : #JinDAMInvocable,
	#instVars : [
		'libraryName',
		'typeReference',
		'realSelector'
	],
	#category : #'JinDAM-Model'
}

{ #category : #generated }
JinDAMExternalFunction >> alias: aString [ 
	realSelector := selector.
	selector := aString
]

{ #category : #accessing }
JinDAMExternalFunction >> libraryName [
	^ libraryName
]

{ #category : #generated }
JinDAMExternalFunction >> libraryName: aString [ 
	libraryName := aString 
]

{ #category : #accessing }
JinDAMExternalFunction >> printOn: aStream [

	aStream
		nextPutAll: ' external ( ';
		nextPutAll: libraryName;
		nextPutAll: ' )';
		nextPutAll: typeReference typeName;
		nextPutAll: ' ';
		nextPutAll: selector;
		nextPutAll: ' ';
		nextPut: $(.
	aStream
		nextPutAll: (',' join: (parameters collect: [ :a | a printString ]));
		nextPut: $)
]

{ #category : #accessing }
JinDAMExternalFunction >> realSelector [
	^ realSelector
]

{ #category : #accessing }
JinDAMExternalFunction >> relatedSymbolKind [

	^ JinNSKind externalFunction
]

{ #category : #accessing }
JinDAMExternalFunction >> typeReference: aJinDAMTypeReference [ 
	typeReference := aJinDAMTypeReference
]

{ #category : #accessing }
JinDAMExternalFunction >> visibility: aString [

	visibility := aString
]
