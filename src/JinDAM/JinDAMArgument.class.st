"
I represent an argument. 

"
Class {
	#name : #JinDAMArgument,
	#superclass : #JinDAMEntity,
	#instVars : [
		'reads',
		'text',
		'expression',
		'usesAddressOf'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMArgument >> accept: aVisitor [  
	^ aVisitor visitArgument: self.

]

{ #category : #accessing }
JinDAMArgument >> accesses [
	 ^ reads 
]

{ #category : #adding }
JinDAMArgument >> addAccess: aJinDAMAccessRead [

	self reads add: aJinDAMAccessRead
]

{ #category : #accessing }
JinDAMArgument >> expression [
	^ expression
]

{ #category : #generated }
JinDAMArgument >> expression: aJinDAMBinaryOperation [
	expression := aJinDAMBinaryOperation
]

{ #category : #adding }
JinDAMArgument >> printOn: aStream [

	aStream
		nextPutAll: 'Arg(Text: ';
		nextPutAll: text;
		nextPut: $)
]

{ #category : #adding }
JinDAMArgument >> reads [

	^ reads ifNil: [ reads := OrderedCollection new ]
]

{ #category : #accessing }
JinDAMArgument >> text [
	^ text
]

{ #category : #accessing }
JinDAMArgument >> text: aString [

	text := aString
]

{ #category : #accessing }
JinDAMArgument >> usesAddressOf: aBoolean [ 
	usesAddressOf := aBoolean
]
