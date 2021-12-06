Class {
	#name : #JinSharedCollection,
	#superclass : #Object,
	#instVars : [
		'mutex',
		'collection'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #adding }
JinSharedCollection >> add: anObject [

	mutex critical: [ collection add: anObject ]
]

{ #category : #adding }
JinSharedCollection >> allSatisfy: aBlock [

	^ self copyCollection allSatisfy: [ :a | aBlock value: a ]
]

{ #category : #adding }
JinSharedCollection >> anySatisfy: aBlock [

	^ self copyCollection anySatisfy: [ :a | aBlock value: a ]
]

{ #category : #adding }
JinSharedCollection >> collect: aBlock [

	^ self copyCollection collect: [ :a | aBlock value: a ]
]

{ #category : #accessing }
JinSharedCollection >> collection [
	^ collection
]

{ #category : #adding }
JinSharedCollection >> copyCollection [
	| cp |
	mutex critical: [ cp := collection copy ].
	^ cp
]

{ #category : #adding }
JinSharedCollection >> do: aBlock [

	self copyCollection do: [ :a | aBlock value: a ]
]

{ #category : #adding }
JinSharedCollection >> initialize [

	super initialize.
	collection := OrderedCollection new.
	mutex := Mutex new.
	
]

{ #category : #adding }
JinSharedCollection >> printOn: aStream [

	aStream nextPutAll: 'SharedCollection'.
	collection printElementsOn: aStream
]

{ #category : #adding }
JinSharedCollection >> select: aBlock [

	^ self copyCollection select: [ :a | aBlock value: a ]
]

{ #category : #'as yet unclassified' }
JinSharedCollection >> unsafeCopyCollection [

	^ collection copy
]

{ #category : #enumerating }
JinSharedCollection >> unsafeSelect: aFullBlockClosure [

	^ collection select: aFullBlockClosure
]
