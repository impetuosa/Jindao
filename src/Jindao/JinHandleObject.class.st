Class {
	#name : #JinHandleObject,
	#superclass : #Object,
	#instVars : [
		'handle',
		'project'
	],
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinHandleObject >> ensureIsLoaded [
	self isLoaded
		ifFalse: [ self load ]
]

{ #category : #'as yet unclassified' }
JinHandleObject >> handle [
	^ handle
]

{ #category : #accessing }
JinHandleObject >> handle: aHandle [
	handle := aHandle
]

{ #category : #'as yet unclassified' }
JinHandleObject >> isLoaded [
	^ handle propertyNamed: #IsLoaded
]

{ #category : #accessing }
JinHandleObject >> name [
	^ handle propertyNamed: #Name
]

{ #category : #accessing }
JinHandleObject >> project: aProject [
	project := aProject
]
