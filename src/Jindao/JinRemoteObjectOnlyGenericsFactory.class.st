"
I am a factory that returns allways instances of a given class. 
"
Class {
	#name : #JinRemoteObjectOnlyGenericsFactory,
	#superclass : #JinRemotesFactory,
	#category : #'Jindao-Factories'
}

{ #category : #accessing }
JinRemoteObjectOnlyGenericsFactory >> classFor: aControl ifNone: aBlock [
	^ self defaultHierarchyClass
]
