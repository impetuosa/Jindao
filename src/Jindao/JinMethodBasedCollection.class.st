Class {
	#name : #JinMethodBasedCollection,
	#superclass : #JinCollection,
	#category : #'Jindao-RemoteCollections'
}

{ #category : #'as yet unclassified' }
JinMethodBasedCollection >> at: anIndex [
	^ factory elementFor: (handle dispatch: 'Item' withArguments: {(anIndex - base)})
]

{ #category : #'as yet unclassified' }
JinMethodBasedCollection >> initialize [
	super initialize.
	base := 0
]
