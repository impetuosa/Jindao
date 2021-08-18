Class {
	#name : #JinDAMArgument,
	#superclass : #JinDAMEntity,
	#instVars : [
		'reads',
		'text'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMArgument >> addAccess: aJinDAMAccessRead [

	self reads add: aJinDAMAccessRead
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
JinDAMArgument >> text: aString [

	text := aString
]
