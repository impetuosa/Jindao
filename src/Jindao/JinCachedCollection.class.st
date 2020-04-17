Class {
	#name : #JinCachedCollection,
	#superclass : #JinCollection,
	#instVars : [
		'collection'
	],
	#category : #'Jindao-RemoteCollections'
}

{ #category : #'as yet unclassified' }
JinCachedCollection >> at: anIndex [
	(self collection at: anIndex) = self ifTrue: [  
		self collection at: anIndex put: (handle propertyNamed: 'Item' withArguments: {(anIndex - 1)}).
		].
	^ factory elementFor: (self collection at: anIndex)
]

{ #category : #'as yet unclassified' }
JinCachedCollection >> collection [
	^ collection
		ifNil: [ collection := OrderedCollection new: self size ]
]
