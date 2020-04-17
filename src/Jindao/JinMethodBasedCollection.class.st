Class {
	#name : #JinMethodBasedCollection,
	#superclass : #JinCollection,
	#category : #'Jindao-RemoteCollections'
}

{ #category : #'as yet unclassified' }
JinMethodBasedCollection >> at: anIndex [
	^ factory elementFor: (handle dispatch: 'Item' withArguments: {(anIndex)})
]
