Class {
	#name : #JinDAMTypeReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'typeName',
		'dimensions'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMTypeReference >> dimensions [
	^ dimensions ifNil:[ 0  ]
]

{ #category : #accessing }
JinDAMTypeReference >> isArray [ 
	 ^ self dimensions > 0 
]

{ #category : #accessing }
JinDAMTypeReference >> isTypeReference [
	^ true
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
