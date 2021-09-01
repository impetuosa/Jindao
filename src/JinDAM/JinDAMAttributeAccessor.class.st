Class {
	#name : #JinDAMAttributeAccessor,
	#superclass : #JinDAMFunction,
	#instVars : [
		'kind',
		'attribute'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMAttributeAccessor >> accept: aVisitor [  
	^ aVisitor visitAttributeAccessor: self.

]

{ #category : #accessing }
JinDAMAttributeAccessor >> attribute [
	^ attribute
]

{ #category : #accessing }
JinDAMAttributeAccessor >> attribute: aJinDAMAttribute [

	attribute := aJinDAMAttribute
]

{ #category : #accessing }
JinDAMAttributeAccessor >> isAttributeGetter [
	 ^ self isGet 
]

{ #category : #testing }
JinDAMAttributeAccessor >> isGet [

	^ kind asLowercase = #get
]

{ #category : #accessing }
JinDAMAttributeAccessor >> kind [
	^ kind
]

{ #category : #accessing }
JinDAMAttributeAccessor >> kind: aString [ 
	kind := aString
]

{ #category : #accessing }
JinDAMAttributeAccessor >> printOn: aStream [

	kind = #Get ifTrue: [ 
		aStream
			nextPutAll: typeReference name;
			nextPutAll: ' ' ].
	aStream
		nextPutAll: kind;
		nextPutAll: ' ';
		nextPutAll: selector;
		nextPutAll: ' ';
		nextPut: $(.
	aStream
		nextPutAll: (',' join: (parameters collect: [ :a | a printString ]));
		nextPut: $)
]

{ #category : #accessing }
JinDAMAttributeAccessor >> relatedSymbolKind [
	^( #is, kind ) asSymbol 
]

{ #category : #accessing }
JinDAMAttributeAccessor >> signature [

	^ kind, ' ' , super signature
]
