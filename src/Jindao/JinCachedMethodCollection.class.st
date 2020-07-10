"
I point to a remote access collection. I have a cache at the level of accessed content (before passing by the factory. I for creation of entities at eachtime )
"
Class {
	#name : #JinCachedMethodCollection,
	#superclass : #JinMethodBasedCollection,
	#instVars : [
		'collection'
	],
	#category : #'Jindao-RemoteCollections'
}

{ #category : #accessing }
JinCachedMethodCollection >> at: anIndex [
	(self collection at: anIndex) = self
		ifTrue: [ self collection at: anIndex put: (super at: anIndex) ].
	^ factory elementFor: (self collection at: anIndex)
]

{ #category : #accessing }
JinCachedMethodCollection >> collection [
	^ collection
		ifNil: [ collection := OrderedCollection new: self size withAll: self ]
]
