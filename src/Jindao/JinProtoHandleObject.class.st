Class {
	#name : #JinProtoHandleObject,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #'Jindao-DomainObjects-Properties'
}

{ #category : #'as yet unclassified' }
JinProtoHandleObject class >> mappedTypeName [
	^ false 
]

{ #category : #'as yet unclassified' }
JinProtoHandleObject class >> mapsWith: aTypeName [
	^ aTypeName = self mappedTypeName
]

{ #category : #'as yet unclassified' }
JinProtoHandleObject >> handle [
	^ handle
]

{ #category : #accessing }
JinProtoHandleObject >> handle: aHandle [
	handle := aHandle
]

{ #category : #'as yet unclassified' }
JinProtoHandleObject >> nameWithoutSpaces [
	^ ((self name copyReplaceAll: ' ' with: '')
		copyReplaceAll: '/'
		with: '') copyReplaceAll: '-' with: '_'
]

{ #category : #accessing }
JinProtoHandleObject >> printOn: aStream [
	aStream nextPutAll: self class name ; nextPut:$[ ; nextPutAll: self name ; nextPut: $]
]
