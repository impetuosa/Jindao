Class {
	#name : #JinDAMSubProcedure,
	#superclass : #JinDAMBehavioural,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMSubProcedure >> accept: aVisitor [  
	^ aVisitor visitSubProcedure: self.

]

{ #category : #accessing }
JinDAMSubProcedure >> printOn: aStream [

	aStream
		nextPutAll: 'sub ';
		nextPutAll: selector;
		nextPutAll: ' ';
		nextPut: $(.
	aStream
		nextPutAll: (',' join: (parameters collect: [ :a | a printString ]));
		nextPut: $)
]

{ #category : #accessing }
JinDAMSubProcedure >> relatedSymbolKind [

	^ JinNSKind sub
]
