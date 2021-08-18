Class {
	#name : #JinDAMAttributeAccessor,
	#superclass : #JinDAMFunction,
	#instVars : [
		'kind',
		'attribute'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMAttributeAccessor >> attribute: aJinDAMAttribute [

	attribute := aJinDAMAttribute
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

	aStream
		nextPutAll: typeReference name;
		nextPutAll: ' ';
		nextPutAll: kind;
		nextPutAll: ' ';
		nextPutAll: selector;
		nextPutAll: ' ';
		nextPut: $(.
	aStream
		nextPutAll: (',' join: (parameters collect: [ :a | a printString ]));
		nextPut: $)
]
