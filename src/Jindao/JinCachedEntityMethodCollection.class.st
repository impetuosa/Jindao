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
