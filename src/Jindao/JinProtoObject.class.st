Class {
	#name : #JinProtoObject,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #'Jindao-DomainObjects-Properties'
}

{ #category : #'as yet unclassified' }
JinProtoObject class >> mappedTypeName [
	^ false 
]

{ #category : #'as yet unclassified' }
JinProtoObject class >> mapsWith: aTypeName [
	^ aTypeName = self mappedTypeName
]

{ #category : #'as yet unclassified' }
JinProtoObject >> beCached [
	handle := handle asCachedHandle.
]

{ #category : #'as yet unclassified' }
JinProtoObject >> handle [
	^ handle
]

{ #category : #accessing }
JinProtoObject >> handle: aHandle [
	handle := aHandle.
	self beCached
]

{ #category : #'as yet unclassified' }
JinProtoObject >> nameWithoutSpaces [
	^ ((self name copyReplaceAll: ' ' with: '')
		copyReplaceAll: '/'
		with: '') copyReplaceAll: '-' with: '_'
]

{ #category : #accessing }
JinProtoObject >> printOn: aStream [
	aStream nextPutAll: self class name ; nextPut:$[ ; nextPutAll: self name ; nextPut: $]
]
