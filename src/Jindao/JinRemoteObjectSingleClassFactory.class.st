"
I am a factory that returns allways instances of a given class. 
"
Class {
	#name : #JinRemoteObjectSingleClassFactory,
	#superclass : #JinRemotesFactory,
	#category : #'Jindao-Core-Factories'
}

{ #category : #accessing }
JinRemoteObjectSingleClassFactory >> classFor: aControl ifNone: aBlock [
		<doc:
	'It allways return the defaultHiearchyClass of this object. This factory yields always instances of the *same* class '>
	^ self defaultHierarchyClass
]
