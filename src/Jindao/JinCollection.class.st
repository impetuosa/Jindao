Class {
	#name : #JinCollection,
	#superclass : #Object,
	#instVars : [
		'handle',
		'factory'
	],
	#category : #'Jindao-RemoteCollections'
}

{ #category : #'instance creation' }
JinCollection class >> newDefault [ 
	^ JinCachedEntityCollection new
]

{ #category : #'instance creation' }
JinCollection class >> newDefaultForMethod [ 
	^ JinMethodBasedCollection new
]

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
JinCollection >> detect: aBlock ifFound: foundBlock [
	self
		detect: aBlock
		ifFound: foundBlock
		ifNone: [ "Do nothing on purpose" ]
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
JinCollection >> factory: anInstanceFactory [
	factory := anInstanceFactory
]

{ #category : #'as yet unclassified' }
JinCollection >> first [
	^ self at: 1 
]

{ #category : #'as yet unclassified' }
JinCollection >> flatCollect: aBlock [
	| col |
	col := OrderedCollection new: self size.
	self do: [ :each | col addAll: (aBlock value: each) ].
	^ col
]

{ #category : #'as yet unclassified' }
JinCollection >> groupedBy: aBlock [
	"Answer a dictionary whose keys are the result of evaluating aBlock for all my elements, and the value for each key is the selection of my elements that evaluated to that key. Uses species."
	
	| groups |
	groups := OrderedDictionary new.
	self do: [ :each |
		(groups at: (aBlock value: each) ifAbsentPut: [ OrderedCollection new ]) add: each ].
	self species ~~ OrderedCollection ifTrue: [
		groups associationsDo: [ :association |
			association value: (OrderedCollection withAll: association value) ]].
	^ groups

]

{ #category : #'as yet unclassified' }
JinCollection >> handle: aHandle [
	self size = (aHandle propertyNamed: #Count)
		ifFalse: [ 
			handle := aHandle ]
]

{ #category : #'as yet unclassified' }
JinCollection >> handle: aCOMDispatchInstance factory: anInstanceFactory [
	handle := aCOMDispatchInstance.
	factory := anInstanceFactory
]

{ #category : #'as yet unclassified' }
JinCollection >> second [
	^ self at:2 
]

{ #category : #'as yet unclassified' }
JinCollection >> select: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. Collect into a new collection like the receiver, only those elements for which aBlock evaluates to true. Answer the new collection."

	"(#(1 2 3 4 5) select: #even) >>> #(2 4)"

	| newCollection |
	newCollection := OrderedCollection new.
	self
		do: [ :each | 
			(aBlock value: each)
				ifTrue: [ newCollection add: each ] ].
	^ newCollection
]

{ #category : #'as yet unclassified' }
JinCollection >> select: selectBock thenDo: aBlock [
	
	| each |
	1 to: self size do: [ :index |
		(selectBock value: (each := self at: index))
			ifTrue: [ aBlock value: each ]].
]

{ #category : #'as yet unclassified' }
JinCollection >> size [
	^ handle propertyNamed: #Count
]
