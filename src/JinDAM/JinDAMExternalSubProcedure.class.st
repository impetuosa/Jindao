Class {
	#name : #JinDAMExternalSubProcedure,
	#superclass : #JinDAMInvocable,
	#instVars : [
		'library'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMExternalSubProcedure >> printOn: aStream [

	aStream
		nextPutAll: ' external ( ';
		nextPutAll: library;
		nextPutAll: ') ';
		nextPutAll: selector;
		nextPutAll: ' ';
		nextPut: $(.
	aStream
		nextPutAll: (',' join: (parameters collect: [ :a | a printString ]));
		nextPut: $)
]

{ #category : #accessing }
JinDAMExternalSubProcedure >> relatedSymbolKind [

	^ JinNSKind externalSub
]
