Class {
	#name : #JinDAMMemberReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'name',
		'arguments',
		'realArguments'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMMemberReference >> accept: aVisitor [  
	^ aVisitor visitMemberReference: self.

]

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

	^ candidate isNotNil and: [ 
		  candidate isCollection
			  ifTrue: [ candidate anySatisfy: #isInvocable ]
			  ifFalse: [ candidate isInvocable ] ]
]

{ #category : #accessing }
JinDAMMemberReference >> isTypeReference [

	candidate isCollection ifTrue: [ ^ candidate first isType ].
	(candidate isNotNil and: [ candidate isType ]) ifTrue: [ ^ true ].
	^ (context isVariable or: [ context isAttributeGetter ]) and: [ 
		  context typeReference = self ]
]

{ #category : #accessing }
JinDAMMemberReference >> isUndefinedType [

	^ self isTypeReference and: [ name = '#_TypeUndefined' ]
]

{ #category : #accessing }
JinDAMMemberReference >> isUnknownReference [

	^ candidate isNil
]

{ #category : #accessing }
JinDAMMemberReference >> isUnknownType [

	^ self isTypeReference and: [ candidate isNil ]
]

{ #category : #accessing }
JinDAMMemberReference >> isVariableReference [
	^ candidate isNotNil and: [ candidate isVariable  ]
]

{ #category : #accessing }
JinDAMMemberReference >> kindAccess [
	^ kindAccess 
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
JinDAMMemberReference >> realArguments [
	^ realArguments
]

{ #category : #accessing }
JinDAMMemberReference >> selector [ 
	 ^ name 
]

{ #category : #accessing }
JinDAMMemberReference >> selector: aString [ 
	name := aString
]

{ #category : #accessing }
JinDAMMemberReference >> signature [
	^ self printString 
]
