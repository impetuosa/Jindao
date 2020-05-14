"
I am an abstract factory that gives general guidelines on the creation of an object mapping a remote object 
"
Class {
	#name : #JinRemotesFactory,
	#superclass : #Object,
	#instVars : [
		'parent',
		'defaultHierarchyClass'
	],
	#category : #'Jindao-Factories'
}

{ #category : #'instance creation' }
JinRemotesFactory class >> defaultFactory [
	^ JinRemoteObjectMappedTypesFactory
]

{ #category : #'instance creation' }
JinRemotesFactory class >> newDefaultAccessPropertyFactory [
	^ self defaultFactory new
		defaultHierarchyClass: JinAccessProperty;
		yourself
]

{ #category : #'instance creation' }
JinRemotesFactory class >> newDefaultControlsFactory [
	^ self defaultFactory new
		defaultHierarchyClass: JinControlGeneric;
		yourself
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
	^ (self instanceFor: aControl)
		handle: aControl;
		parent: parent;
		yourself
]

{ #category : #accessing }
JinRemotesFactory >> instanceFor: aControl [
	^ (self classFor: aControl) new
]

{ #category : #accessing }
JinRemotesFactory >> parent: aParent [
	parent := aParent 
]
