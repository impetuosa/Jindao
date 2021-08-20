Class {
	#name : #JinDAMMemberReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'name',
		'arguments'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMMemberReference >> addArgument: aJinDAMArgument [ 
	 self arguments add: aJinDAMArgument
]

{ #category : #accessing }
JinDAMMemberReference >> arguments [
	^ arguments ifNil: [ arguments := OrderedCollection new  ]
]

{ #category : #accessing }
JinDAMMemberReference >> dimensions [
	 ^ 0
]

{ #category : #accessing }
JinDAMMemberReference >> isInvocableReference [
	^ candidate isNotNil and: [ candidate isInvocable   ]
]

{ #category : #accessing }
JinDAMMemberReference >> isTypeReference [
	^ candidate isNotNil and: [ candidate isType  ]
]

{ #category : #accessing }
JinDAMMemberReference >> isUnknownReference [

	^ candidate isNil
]

{ #category : #accessing }
JinDAMMemberReference >> isVariableReference [
	^ candidate isNotNil and: [ candidate isVariable  ]
]

{ #category : #accessing }
JinDAMMemberReference >> name [ 
	 ^ name 
]

{ #category : #accessing }
JinDAMMemberReference >> name: aName [

	name := aName
]

{ #category : #accessing }
JinDAMMemberReference >> printOn: aStream [

	super printOn: aStream.
	arguments ifNil: [ ^ self ].
	aStream nextPut: $(.
	aStream
		nextPutAll: (',' join: (arguments collect: [ :a | a printString ]));
		nextPut: $)
]

{ #category : #accessing }
JinDAMMemberReference >> selector [ 
	 ^ name 
]

{ #category : #accessing }
JinDAMMemberReference >> selector: aString [ 
	name := aString
]
