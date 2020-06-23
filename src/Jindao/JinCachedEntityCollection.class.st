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
