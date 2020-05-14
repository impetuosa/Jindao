Class {
	#name : #JinRemoteObjectMappedTypesFactory,
	#superclass : #JinRemotesFactory,
	#category : #'Jindao-Factories'
}

{ #category : #accessing }
JinRemoteObjectMappedTypesFactory >> classFor: aRemoteObject ifNone: aBlock [
	^ self mappedControlsCollection
		detect: [ :a | self remoteObject: aRemoteObject mapsWith: a ]
		ifNone: [ aBlock value ]
]

{ #category : #accessing }
JinRemoteObjectMappedTypesFactory >> control: aControl mapsWith: aJinControlClass [
	^ aControl getTypeInfo name = aJinControlClass mappedTypeName
]

{ #category : #accessing }
JinRemoteObjectMappedTypesFactory >> mappedControlsCollection [
	^ self defaultHierarchyClass allSubclasses
]

{ #category : #accessing }
JinRemoteObjectMappedTypesFactory >> remoteObject: aRemoteObject mapsWith: aJinMappedType [
	^ aJinMappedType mapsWith: aRemoteObject
]
