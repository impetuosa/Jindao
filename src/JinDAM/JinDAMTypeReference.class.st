Class {
	#name : #JinDAMTypeReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'typeName',
		'dimensions'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMTypeReference >> accept: aVisitor [

	^ aVisitor visitTypeReference: self
]

{ #category : #testing }
JinDAMTypeReference >> beUndefinedType [

	typeName := '#_TypeUndefined'
]

{ #category : #accessing }
JinDAMTypeReference >> dimensions [
	^ dimensions ifNil:[ 0  ]
]

{ #category : #accessing }
JinDAMTypeReference >> dimensions: aCollection [ 
	dimensions := aCollection
]

{ #category : #accessing }
JinDAMTypeReference >> isArray [ 
	 ^ self dimensions > 0 
]

{ #category : #testing }
JinDAMTypeReference >> isNull [

	^ typeName isNotNil and: [ typeName asLowercase = #null ]
]

{ #category : #accessing }
JinDAMTypeReference >> isTypeReference [
	^ true
]

{ #category : #testing }
JinDAMTypeReference >> isUndefinedType [
	 ^ typeName = '#_TypeUndefined'
]

{ #category : #testing }
JinDAMTypeReference >> isUnknownType [

	^ self isUndefinedType not and: [ candidate isNil ]
]

{ #category : #testing }
JinDAMTypeReference >> isVariableReference [
	 ^ candidate isVariable 
]

{ #category : #accessing }
JinDAMTypeReference >> name [
	 ^ typeName 
]

{ #category : #accessing }
JinDAMTypeReference >> typeName [

	^ typeName
]

{ #category : #accessing }
JinDAMTypeReference >> typeName: aString [
	aString = 'eIdentifiant' ifTrue: [ self halt.  ].
	typeName := aString
]
