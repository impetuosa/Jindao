"
A remote object factory creates instances of our model based on some guidelines. 
This different factories are configured resolve the class to create based on a naming convention for mapping. 



I am an abstract factory that gives general guidelines on the creation of an object mapping a remote object 
"
Class {
	#name : #JinRemotesFactory,
	#superclass : #Object,
	#instVars : [
		'defaultHierarchyClass',
		'scope'
	],
	#category : #'Jindao-Core-Factories'
}

{ #category : #'instance creation' }
JinRemotesFactory class >> defaultFactory [
	^ JinRemoteObjectMappedClassFactory
]

{ #category : #'instance creation' }
JinRemotesFactory class >> newDefaultAccessPropertyFactory [
	| f |
	f := self defaultFactory.
	self assert: f ~= self.
	^ f newDefaultAccessPropertyFactory
]

{ #category : #'instance creation' }
JinRemotesFactory class >> newDefaultControlsFactory [
	| f |
	f := self defaultFactory.
	self assert: f ~= self.
	^ f newDefaultControlsFactory
]

{ #category : #accessing }
JinRemotesFactory >> classFor: aControl [

	<doc:
	'Returns a class to instantiate to represent a given remote handle. If none is found, it returns the defaultHierarchyClass with which this object has been configured.'>
	^ self classFor: aControl ifNone: [ self defaultHierarchyClass ]
]

{ #category : #accessing }
JinRemotesFactory >> classFor: aControl ifNone: aBlock [
	self subclassResponsibility 
]

{ #category : #accessing }
JinRemotesFactory >> defaultHierarchyClass [
	^ defaultHierarchyClass
]

{ #category : #accessing }
JinRemotesFactory >> defaultHierarchyClass: aClass [

	<doc:
	'Sets the class that has been used to create new instances when required.'>
	defaultHierarchyClass := aClass
]

{ #category : #accessing }
JinRemotesFactory >> elementFor: aControl [
	| instance |
	instance := (self instanceFor: aControl) handle: aControl.
	scope ifNotNil: [ instance scopedBy: scope ].
	^ instance
]

{ #category : #accessing }
JinRemotesFactory >> instanceFor: aControl [
	^ (self classFor: aControl) new
]

{ #category : #'as yet unclassified' }
JinRemotesFactory >> scopedBy: aJinFormBody [
	scope := aJinFormBody
]
