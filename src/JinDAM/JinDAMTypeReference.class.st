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
JinDAMTypeReference >> name [
	 ^ typeName 
]

{ #category : #accessing }
JinDAMTypeReference >> typeName [

	^ typeName
]

{ #category : #accessing }
JinDAMTypeReference >> typeName: aString [ 
	typeName := aString.
	aString isCharacter ifTrue: [ self halt ].

]
