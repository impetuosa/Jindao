Class {
	#name : #JinCollection,
	#superclass : #Object,
	#instVars : [
		'handle',
		'factory'
	],
	#category : #'Jindao-RemoteCollections'
}

{ #category : #'as yet unclassified' }
JinCollection >> at: anIndex [
	^ factory elementFor: (handle propertyNamed: 'Item' withArguments: {(anIndex - 1)})
]

{ #category : #'as yet unclassified' }
JinCollection >> collect: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into a collection like the receiver. Answer  
	the new collection."

	| newCollection |
	newCollection := OrderedCollection new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^ newCollection
]

{ #category : #'as yet unclassified' }
JinCollection >> detect: aBlock [ 
	^ self detect: aBlock ifNone: [self errorNotFound: aBlock]
]

{ #category : #'as yet unclassified' }
JinCollection >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [
	self
		do: [ :each | 
			(aBlock value: each)
				ifTrue: [ ^ foundBlock cull: each ] ].
	^ exceptionBlock value	
]

{ #category : #'as yet unclassified' }
JinCollection >> detect: aBlock ifNone: exceptionBlock [

	^ self detect: aBlock ifFound: [ :element | element ] ifNone: exceptionBlock
]

{ #category : #'as yet unclassified' }
JinCollection >> do: aBlock [
	1 to: self size do: [ :index | aBlock value: (self at: index) ]
]

{ #category : #'as yet unclassified' }
JinCollection >> handle: aCOMDispatchInstance factory: anInstanceFactory [
	handle := aCOMDispatchInstance.
	factory := anInstanceFactory
]

{ #category : #'as yet unclassified' }
JinCollection >> select: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument. Collect into a new collection like the receiver, only those elements for which aBlock evaluates to true. Answer the new collection."
	"(#(1 2 3 4 5) select: #even) >>> #(2 4)"
	
	| newCollection |
	newCollection := self class new.
	self do: [ :each | 
		(aBlock value: each) 
			ifTrue: [ newCollection add: each ]].
	^newCollection
]

{ #category : #'as yet unclassified' }
JinCollection >> size [
	^ handle propertyNamed: #Count
]
