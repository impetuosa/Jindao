"
I point to a remote access collection. I have a cache at the level of accessed content (before passing by the factory. I for creation of entities at eachtime )
"
Class {
	#name : #JinCachedCollection,
	#superclass : #JinCollection,
	#instVars : [
		'collection'
	],
	#category : #'Jindao-Core-RemoteCollections'
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
		ifNil: [ collection := OrderedCollection new: self size withAll: self ]
		ifNotNil: [ collection size < self size
				ifFalse: [ collection ]
				ifTrue: [ collection := collection
						, (OrderedCollection new: self size - collection size withAll: self) ] ]
]

{ #category : #'as yet unclassified' }
JinCachedCollection >> handle: aHandle [
	self size = (aHandle propertyNamed: #Count)
		ifFalse: [ 
			collection := nil .
			handle := aHandle ]
]
