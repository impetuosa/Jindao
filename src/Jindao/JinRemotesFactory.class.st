"
I am an abstract factory that gives general guidelines on the creation of an object mapping a remote object 
"
Class {
	#name : #JinRemotesFactory,
	#superclass : #Object,
	#instVars : [
		'defaultHierarchyClass',
		'scope'
	],
	#category : #'Jindao-Factories'
}

{ #category : #'instance creation' }
JinRemotesFactory class >> defaultFactory [
	^ JinRemoteObjectMappedTypesFactory
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
