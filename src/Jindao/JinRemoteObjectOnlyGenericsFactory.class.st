Class {
	#name : #JinRemoteObjectOnlyGenericsFactory,
	#superclass : #JinRemotesFactory,
	#category : #'Jindao-Factories'
}

{ #category : #accessing }
JinRemoteObjectOnlyGenericsFactory >> classFor: aControl ifNone: aBlock [
	^ self defaultHierarchyClass
]
