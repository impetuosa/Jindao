Class {
	#name : #JinDAMExternalSubProcedure,
	#superclass : #JinDAMInvocable,
	#instVars : [
		'library',
		'libraryName',
		'alias'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMExternalSubProcedure >> accept: aVisitor [  
	^ aVisitor visitExternalSubProcedure: self.

]

{ #category : #generated }
JinDAMExternalSubProcedure >> alias: aString [

	alias := aString
]

{ #category : #accessing }
JinDAMExternalSubProcedure >> isExternal [ 
	^ true 
]

{ #category : #accessing }
JinDAMExternalSubProcedure >> libraryName [
	^ libraryName
]

{ #category : #generated }
JinDAMExternalSubProcedure >> libraryName: aString [ 
	libraryName := aString 
]

{ #category : #accessing }
JinDAMExternalSubProcedure >> printOn: aStream [

	aStream
		nextPutAll: ' external ( ';
		nextPutAll: libraryName;
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

{ #category : #accessing }
JinDAMExternalSubProcedure >> visibility: aString [

	visibility := aString
]
