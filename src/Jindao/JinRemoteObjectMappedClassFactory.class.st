"
This factory creates instances of a class that maps with the remote object to represent.

This factory checks a mappable classes all the subclasses of a given class (defaultHierarchyClass). 


"
Class {
	#name : #JinRemoteObjectMappedClassFactory,
	#superclass : #JinRemotesFactory,
	#instVars : [
		'nameResolver'
	],
	#category : #'Jindao-Core-Factories'
}

{ #category : #'instance creation' }
JinRemoteObjectMappedClassFactory class >> newDefaultAccessPropertyFactory [
	^ self defaultFactory new
		defaultHierarchyClass: JinAccessProperty;
		nameResolver: [ :d | d propertyNamed: #Name ];
		yourself
]

{ #category : #'instance creation' }
JinRemoteObjectMappedClassFactory class >> newDefaultControlsFactory [
	^ self defaultFactory new
		defaultHierarchyClass: JinControlGeneric;
		nameResolver: [ :a | a getTypeInfo name ];
		yourself
]

{ #category : #accessing }
JinRemoteObjectMappedClassFactory >> classFor: aRemoteObject ifNone: aBlock [

	<doc:'Check in between all the subclasses of the defaultHierarchyClass if anyone is able to contain aRemoteObject handle.'>
	^ self mappedControlsCollection
		detect: [ :a | self remoteObject: (self resolveNameForClassGeneration: aRemoteObject) mapsWith: a ]
		ifNone: [ aBlock value ]
]

{ #category : #accessing }
JinRemoteObjectMappedClassFactory >> mappedControlsCollection [
	^ self defaultHierarchyClass superclass allSubclasses
]

{ #category : #accessing }
JinRemoteObjectMappedClassFactory >> nameResolver: aBlock [
	<doc:'Sets a block able to extract TYPE name out of a handle. The name is after used to query for possible matching classes by name'>
	nameResolver := aBlock
]

{ #category : #accessing }
JinRemoteObjectMappedClassFactory >> remoteObject: aRemoteObject mapsWith: aJinMappedType [
	^ aJinMappedType mapsWith: aRemoteObject
]

{ #category : #'as yet unclassified' }
JinRemoteObjectMappedClassFactory >> resolveNameForClassGeneration: aCOMDispatchInstance [
	nameResolver
		ifNil: [ self
				error:
					'The selected kind of factory is bound to generate names. It requires to setup the nameResolver attirbute with a block that receives the remote object handle, and it should return a string ' ].
	^ nameResolver value: aCOMDispatchInstance
]
