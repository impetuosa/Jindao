Class {
	#name : #JinDAMExternalFunction,
	#superclass : #JinDAMInvocable,
	#instVars : [
		'library',
		'typeReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMExternalFunction >> printOn: aStream [

	aStream
		nextPutAll: ' external ( ';
		nextPutAll: library;
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
JinDAMExternalFunction >> relatedSymbolKind [

	^ JinNSKind externalFunction
]
