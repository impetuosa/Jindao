"
This kind of factory maps remote objects to 
"
Class {
	#name : #JinRemoteObjectMappedTypesFactory,
	#superclass : #JinRemotesFactory,
	#instVars : [
		'nameResolver'
	],
	#category : #'Jindao-Factories'
}

{ #category : #'instance creation' }
JinRemoteObjectMappedTypesFactory class >> newDefaultAccessPropertyFactory [
	^ self defaultFactory new
		defaultHierarchyClass: JinAccessProperty;
		nameResolver: [ :d | d propertyNamed: #Name ];
		yourself
]

{ #category : #'instance creation' }
JinRemoteObjectMappedTypesFactory class >> newDefaultControlsFactory [
	^ self defaultFactory new
		defaultHierarchyClass: JinControlGeneric;
		nameResolver: [ :a | a getTypeInfo name ];
		yourself
]

{ #category : #accessing }
JinRemoteObjectMappedTypesFactory >> classFor: aRemoteObject ifNone: aBlock [

	^ self mappedControlsCollection
		detect: [ :a | self remoteObject: (self resolveNameForClassGeneration: aRemoteObject) mapsWith: a ]
		ifNone: [ aBlock value ]
]

{ #category : #accessing }
JinRemoteObjectMappedTypesFactory >> mappedControlsCollection [
	^ self defaultHierarchyClass superclass allSubclasses
]

{ #category : #accessing }
JinRemoteObjectMappedTypesFactory >> nameResolver: aBlock [
	nameResolver := aBlock
]

{ #category : #accessing }
JinRemoteObjectMappedTypesFactory >> remoteObject: aRemoteObject mapsWith: aJinMappedType [
	^ aJinMappedType mapsWith: aRemoteObject
]

{ #category : #'as yet unclassified' }
JinRemoteObjectMappedTypesFactory >> resolveNameForClassGeneration: aCOMDispatchInstance [
	nameResolver
		ifNil: [ self
				error:
					'The selected kind of factory is bound to generate names. It requires to setup the nameResolver attirbute with a block that receives the remote object handle, and it should return a string ' ].
	^ nameResolver value: aCOMDispatchInstance
]
