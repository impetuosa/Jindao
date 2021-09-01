Class {
	#name : #JinDAMFunction,
	#superclass : #JinDAMBehavioural,
	#instVars : [
		'typeReference',
		'typeAnchor'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMFunction >> accept: aVisitor [  
	^ aVisitor visitFunction: self.

]

{ #category : #accessing }
JinDAMFunction >> printOn: aStream [

	typeReference printOn: aStream.
	aStream
		nextPutAll: ' ';
		nextPutAll: selector;
		nextPutAll: ' ';
		nextPut: $(.
	aStream
		nextPutAll: (',' join: (parameters collect: [ :a | a printString ]));
		nextPut: $)
]

{ #category : #accessing }
JinDAMFunction >> relatedSymbolKind [

	^ JinNSKind function
]

{ #category : #accessing }
JinDAMFunction >> signature [

	^ (typeReference ifNil: [ 'Unknown' ] ifNotNil: [ :a | a name ])
	  , ' ' , super signature
]

{ #category : #generated }
JinDAMFunction >> type [
	^ typeReference candidate 
]

{ #category : #accessing }
JinDAMFunction >> typeAnchor: aJinAnchor [ 
	typeAnchor := aJinAnchor
]

{ #category : #accessing }
JinDAMFunction >> typeReference [
	^ typeReference
]

{ #category : #accessing }
JinDAMFunction >> typeReference: aJinDAMTypeReference [

	typeReference := aJinDAMTypeReference
]
