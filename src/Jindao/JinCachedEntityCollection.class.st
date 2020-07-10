"
I have a cache at the level of local entity. I return the same entity for the same positon always. 
"
Class {
	#name : #JinCachedEntityCollection,
	#superclass : #JinCachedCollection,
	#category : #'Jindao-RemoteCollections'
}

{ #category : #'as yet unclassified' }
JinCachedEntityCollection >> at: anIndex [
	(self collection at: anIndex) = self
		ifTrue: [ self collection
				at: anIndex
				put:
					(factory
						elementFor: (handle propertyNamed: 'Item' withArguments: {(anIndex - base)})) ].
	^ self collection at: anIndex
]
