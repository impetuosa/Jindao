"
Microsoft Access uses two kind of collections, one where the accessing to specific properties is done through property access, and a second one where is done through method activation. 
A JinCollection  and JinMethodBasedCollection are a proxy to a remote COM collection.  The first one accesses information as properties the second as method activation. 

Collections are configured with a collection handle and a factory which has the responsibility of creating proxies to the accessed entities within the collection .

The hierarchy of the collection provides slightly different behaviours: 

* JinCollection/JinMethodBasedCollection
This collection is fully virtual. It does not consume much memory. It guarantees that the accessed elements are allways *fresh* as there are allways obtained through the Microsoft Access running instances. 
	
* JinCachedCollection/JinCachedMethodCollection
This collection lazily caches the remote handles of each of the contained elements. 
This caching reduces the systematic access to the instances, however it requires to be refreshed time to time in order to ensure that the collection is trully representing the real collection.

* JinCachedEntityCollection/JinCachedEntityMethodCollection
This collection lazily caches the remote handles of each of the contained elements, and the created element
This caching reduces the systematic access to the instances and the systematic creation of entity objects. This enables to have a better degree of identity for the user of the collection. 
However it requires to be refreshed time to time in order to ensure that the collection is trully representing the real collection.



To create a new instances we encourage to use the class methods:

```
JinCollection>>newDefault 
JinCollection>>newDefaultForMethod 
```


Using this helpers eases the modification of the system consistently. 


"
Class {
	#name : #JinCollection,
	#superclass : #Object,
	#instVars : [
		'handle',
		'factory',
		'base'
	],
	#category : #'Jindao-Core-RemoteCollections'
}

{ #category : #'instance creation' }
JinCollection class >> newDefault [ 
	<doc: 'Creates default class instance of collection based on property access'>
	^ JinCachedEntityCollection new
]

{ #category : #'instance creation' }
JinCollection class >> newDefaultForMethod [ 
	<doc: 'Creates default class instance of collection based on method access '>
	^ JinMethodBasedCollection new
]

{ #category : #'as yet unclassified' }
JinCollection >> allNames [

	| names hand |
	names := OrderedCollection new.
	1 to: self size do: [ :anIndex | 
		hand := handle
			        propertyNamed: 'Item'
			        withArguments: { (anIndex - base) }.
		names add: (hand propertyNamed: 'Name') ].
	^ names
]

{ #category : #'as yet unclassified' }
JinCollection >> anySatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."
	"#(1 3) anySatisfy: [ :each | each even ] >>> false"
	"#(1 2) anySatisfy: [ :each | each even ] >>> true"

	self do: [:each | (aBlock value: each) ifTrue: [^ true]].
	^ false
]

{ #category : #'as yet unclassified' }
JinCollection >> at: anIndex [
		<doc:
	'Accesses the Microsoft Access instance and obtain a handle in a given anIndex. With this handle, it delegates to the factory to create an instance which wrapps the handle.'>
	^ factory elementFor: (handle propertyNamed: 'Item' withArguments: {(anIndex  - base )})
]

{ #category : #'as yet unclassified' }
JinCollection >> base: aBase [
	<doc:
	'Defines the accessing base of the collection. Often 0 or 1.'>
	base := aBase
]

{ #category : #'as yet unclassified' }
JinCollection >> collect: aBlock [

	<doc:
	'Evaluate aBlock with each of the receiver''s elements as the argument.  
Collect the resulting values into a collection like the receiver. Answer  
the new collection.'>
	| newCollection |
	newCollection := OrderedCollection new.
	self do: [ :each | newCollection add: (aBlock value: each) ].
	^ newCollection
]

{ #category : #'as yet unclassified' }
JinCollection >> detect: aBlock [

	<doc:
	'Evaluate aBlock with each of the receiver''s elements as the argument.
Answer the first element for which aBlock evaluates to true.'>
	^ self detect: aBlock ifNone: [ self errorNotFound: aBlock ]
]

{ #category : #'as yet unclassified' }
JinCollection >> detect: aBlock ifFound: foundBlock [

	<doc:
	'Evaluate aBlock with each of the receiver''s elements as the argument.
If some element evaluates aBlock to true, then cull this element into
foundBlock.
If no element matches the criteria then do nothing.
Always returns self to avoid misuse and a potential isNil check on the sender.'>
	self
		detect: aBlock
		ifFound: foundBlock
		ifNone: [ "Do nothing on purpose" ]
]

{ #category : #'as yet unclassified' }
JinCollection >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [

	<doc:
	'Evaluate aBlock with each of the receiver''s elements as the argument.
If some element evaluates aBlock to true, then cull this element into
foundBlock and answer the result of this evaluation.
If none evaluate to true, then evaluate exceptionBlock'>
	self do: [ :each |
		(aBlock value: each) ifTrue: [ ^ foundBlock cull: each ] ].
	^ exceptionBlock value
]

{ #category : #'as yet unclassified' }
JinCollection >> detect: aBlock ifNone: exceptionBlock [

	<doc:
	'Evaluate aBlock with each of the receiver''s elements as the argument.
Answer the first element for which aBlock evaluates to true. If none
evaluate to true, then evaluate the argument, exceptionBlock.'>
	^ self
		  detect: aBlock
		  ifFound: [ :element | element ]
		  ifNone: exceptionBlock
]

{ #category : #'as yet unclassified' }
JinCollection >> do: aBlock [

	<doc:
'Evaluate aBlock with each of the receiver''s elements as the argument.

This is the general foreach method, but for most standard needs there is often a more specific and simpler method.'>
	1 to: self size do: [ :index | aBlock value: (self at: index) ]
]

{ #category : #'as yet unclassified' }
JinCollection >> factory: anInstanceFactory [
	factory := anInstanceFactory
]

{ #category : #'as yet unclassified' }
JinCollection >> first [
	<doc:'Answer the first element of the receiver'>
	^ self at: 1 
]

{ #category : #'as yet unclassified' }
JinCollection >> flatCollect: aBlock [

	<doc:
	'Evaluate aBlock for each of the receiver''s elements and answer the
list of all resulting values flatten one level. Assumes that aBlock returns some kind
of collection for each element. Equivalent to the lisp''s mapcan'>
	| col |
	col := OrderedCollection new: self size.
	self do: [ :each | col addAll: (aBlock value: each) ].
	^ col
]

{ #category : #'as yet unclassified' }
JinCollection >> groupedBy: aBlock [

	<doc:
	'Answer a dictionary whose keys are the result of evaluating aBlock for all my elements, and the value for each key is the selection of my elements that evaluated to that key. Uses species.'>
	| groups |
	groups := OrderedDictionary new.
	self do: [ :each |
		(groups
			 at: (aBlock value: each)
			 ifAbsentPut: [ OrderedCollection new ]) add: each ].
	self species ~~ OrderedCollection ifTrue: [
		groups associationsDo: [ :association |
			association value: (OrderedCollection withAll: association value) ] ].
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

{ #category : #testing }
JinCollection >> ifEmpty: aFullBlockClosure [ 
	^ self isEmpty ifTrue: aFullBlockClosure 
]

{ #category : #'as yet unclassified' }
JinCollection >> initialize [
	super initialize.
	base := 1
]

{ #category : #'as yet unclassified' }
JinCollection >> isCollection [

	^ true
]

{ #category : #testing }
JinCollection >> isEmpty [

	^ self size = 0
]

{ #category : #testing }
JinCollection >> isNotEmpty [
	^ self isEmpty not 
]

{ #category : #'as yet unclassified' }
JinCollection >> reject: rejectBlock thenDo: aBlock [
	<doc:'	Utility method to improve readability.
Do not create the intermediate collection.'>
	|  each |
	
	1 to: self size do: [ :index |
		(rejectBlock value: (each := self at: index))
			ifFalse: [ aBlock value: each ]].
]

{ #category : #'as yet unclassified' }
JinCollection >> second [

	<doc: 'Answer the second element of the receiver'>
	^ self at: 2
]

{ #category : #'as yet unclassified' }
JinCollection >> select: aBlock [
	"(#(1 2 3 4 5) select: #even) >>> #(2 4)"

	<doc:
	'Evaluate aBlock with each of the receiver''s elements as the argument. Collect into a new collection like the receiver, only those elements for which aBlock evaluates to true. Answer the new collection.'>
	| newCollection |
	newCollection := OrderedCollection new.
	self do: [ :each |
		(aBlock value: each) ifTrue: [ newCollection add: each ] ].
	^ newCollection
]

{ #category : #'as yet unclassified' }
JinCollection >> select: selectBock thenDo: aBlock [
	<doc:'	Utility method to improve readability.
Do not create the intermediate collection.'>
	| each |
	1 to: self size do: [ :index |
		(selectBock value: (each := self at: index))
			ifTrue: [ aBlock value: each ]].
]

{ #category : #'as yet unclassified' }
JinCollection >> size [

	<doc: 'Answer how many elements the receiver contains.'>
	^ handle propertyNamed: #Count
]

{ #category : #Moose }
JinCollection >> sorted: aFullBlockClosure [ 
	^ self 
]
