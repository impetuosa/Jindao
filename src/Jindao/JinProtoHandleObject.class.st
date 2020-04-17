Class {
	#name : #JinProtoHandleObject,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinProtoHandleObject >> handle [
	^ handle
]

{ #category : #accessing }
JinProtoHandleObject >> handle: aHandle [
	handle := aHandle
]

{ #category : #accessing }
JinProtoHandleObject >> printOn: aStream [
	aStream nextPutAll: self class name ; nextPut:$[ ; nextPutAll: self name ; nextPut: $]
]
