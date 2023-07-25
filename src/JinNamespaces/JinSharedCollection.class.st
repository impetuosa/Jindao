"
The namespace calculation is architecturized to be done concurrently, as it requires many IO operations. 
For this we provide this shared collection, which manages the concurrent writing and reading of elements. 

Please note that any iteration of the elements of the collection happens over a copy of the internal collection, for what it isdiscouraged to work with indexes.
 

"
Class {
	#name : #JinSharedCollection,
	#superclass : #Object,
	#instVars : [
		'mutex',
		'collection'
	],
	#category : #'JinNamespaces-Collection'
}

{ #category : #adding }
JinSharedCollection >> add: anObject [
	<doc: 'SAFELY add element to the collection'>
	mutex critical: [ collection add: anObject ]
]

{ #category : #adding }
JinSharedCollection >> allSatisfy: aBlock [
	<doc: 'SAFELY applies allSatisfy: to the collection'>
	^ self copyCollection allSatisfy: [ :a | aBlock value: a ]
]

{ #category : #adding }
JinSharedCollection >> anySatisfy: aBlock [
	<doc: 'SAFELY applies anySatisfy: to the collection'>
	^ self copyCollection anySatisfy: [ :a | aBlock value: a ]
]

{ #category : #adding }
JinSharedCollection >> collect: aBlock [
	<doc: 'SAFELY applies collect: to the collection'>
	^ self copyCollection collect: [ :a | aBlock value: a ]
]

{ #category : #accessing }
JinSharedCollection >> collection [
	^ collection
]

{ #category : #adding }
JinSharedCollection >> copyCollection [

	<doc:
	'SAFELY copy the collection. Used internally for most of the collection API'>
	| cp |
	mutex critical: [ cp := collection copy ].
	^ cp
]

{ #category : #adding }
JinSharedCollection >> do: aBlock [
	<doc: 'SAFELY applies do: to the collection'>
	self copyCollection do: [ :a | aBlock value: a ]
]

{ #category : #enumerating }
JinSharedCollection >> flatCollect: aFullBlockClosure [
	<doc: 'UNSAFE applies flatCollect directly to the internal collection'>
	^ collection flatCollect: aFullBlockClosure
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
	<doc: 'SAFELY applies select: to the collection'>
	^ self copyCollection select: [ :a | aBlock value: a ]
]

{ #category : #'as yet unclassified' }
JinSharedCollection >> unsafeCopyCollection [

	<doc: 'UNSAFELY copies the internal collection directly'>
	^ collection copy
]

{ #category : #enumerating }
JinSharedCollection >> unsafeSelect: aFullBlockClosure [

	<doc: 'UNSAFELY applies select: to the internal collection directly'>
	^ collection select: aFullBlockClosure
]
