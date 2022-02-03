Class {
	#name : #JinDAMEvent,
	#superclass : #JinDAMInvocable,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMEvent >> accept: aVisitor [  
	^ aVisitor visitEvent: self.

]

{ #category : #accessing }
JinDAMEvent >> printOn: aStream [

	aStream
		nextPutAll: 'event ';
		nextPutAll: selector;
		nextPutAll: ' ';
		nextPut: $(.
	aStream
		nextPutAll: (',' join: (parameters collect: [ :a | a printString ]));
		nextPut: $)
]

{ #category : #accessing }
JinDAMEvent >> relatedSymbolKind [

	^ JinNSKind event 
]
