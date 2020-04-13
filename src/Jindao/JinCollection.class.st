Class {
	#name : #JinCollection,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinCollection >> handle: aCOMDispatchInstance [ 
	handle := aCOMDispatchInstance
]

{ #category : #'as yet unclassified' }
JinCollection >> size [
	^ handle propertyNamed: #Count
]
