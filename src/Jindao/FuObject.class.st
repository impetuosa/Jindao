Class {
	#name : #FuObject,
	#superclass : #Object,
	#instVars : [
		'success',
		'name',
		'children',
		'properties',
		'type',
		'errorText'
	],
	#category : #'Jindao-FuZhi'
}

{ #category : #accessing }
FuObject >> children [
	^ children
]

{ #category : #accessing }
FuObject >> children: anObject [
	children := anObject
]

{ #category : #accessing }
FuObject >> errorText [
	^ errorText
]

{ #category : #accessing }
FuObject >> errorText: anObject [
	errorText := anObject
]

{ #category : #initialization }
FuObject >> initialize [
	self children: OrderedCollection new. 
	self properties: OrderedCollection new. 
]

{ #category : #accessing }
FuObject >> name [
	^ name
]

{ #category : #initialization }
FuObject >> name: aName [
	name := aName
]

{ #category : #accessing }
FuObject >> properties [
	^ properties
]

{ #category : #accessing }
FuObject >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
FuObject >> success [
	^ success
]

{ #category : #accessing }
FuObject >> success: anObject [
	success := anObject
]

{ #category : #accessing }
FuObject >> type [
	^ type
]

{ #category : #accessing }
FuObject >> type: anObject [
	type := anObject
]
