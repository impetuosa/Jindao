"
I have a cache at the level of local entity. I return the same entity for the same positon always. 
"
Class {
	#name : #JinCachedEntityMethodCollection,
	#superclass : #JinCachedMethodCollection,
	#category : #'Jindao-RemoteCollections'
}

{ #category : #accessing }
JinCachedEntityMethodCollection >> at: anIndex [
	(self collection at: anIndex) = self
		ifTrue: [ self collection
				at: anIndex
				put: (factory elementFor: (super at: anIndex)) ].
	^ self collection at: anIndex
]
