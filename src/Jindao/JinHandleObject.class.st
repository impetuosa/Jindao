Class {
	#name : #JinHandleObject,
	#superclass : #Object,
	#instVars : [
		'handle',
		'loadedObjectHandle',
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
	^ loadedObjectHandle isNotNil
		and: [ handle propertyNamed: #IsLoaded ]
]

{ #category : #'as yet unclassified' }
JinHandleObject >> load [
	loadedObjectHandle := self privateLoadObjectHandle
]

{ #category : #accessing }
JinHandleObject >> name [
	^ handle propertyNamed: #Name
]

{ #category : #accessing }
JinHandleObject >> printOn: aStream [
	aStream nextPutAll: self class name ; nextPut:$[ ; nextPutAll: self name ; nextPut: $]
]

{ #category : #'as yet unclassified' }
JinHandleObject >> privateLoadObjectHandle [
	self subclassResponsibility
]

{ #category : #accessing }
JinHandleObject >> project: aProject [
	project := aProject
]
