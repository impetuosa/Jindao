Class {
	#name : #JinModelObject,
	#superclass : #Object,
	#instVars : [
		'description',
		'body',
		'project'
	],
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinModelObject >> body [
	^ body
		ifNil: [ self load.
			body ]
]

{ #category : #accessing }
JinModelObject >> description: aDescription [
	description := aDescription
]

{ #category : #accessing }
JinModelObject >> isLoaded [
	^ body isNotNil and: [ description isLoaded ]
]

{ #category : #accessing }
JinModelObject >> load [
	self isLoaded
		ifFalse: [ body := self privateLoadBodyObject ]
]

{ #category : #'as yet unclassified' }
JinModelObject >> name [
	^ description name 
]

{ #category : #'as yet unclassified' }
JinModelObject >> nameWithoutSpaces [
	^ ((self name copyReplaceAll: ' ' with: '')
		copyReplaceAll: '/'
		with: '') copyReplaceAll: '-' with: '_'
]

{ #category : #accessing }
JinModelObject >> printOn: aStream [
	aStream nextPutAll: self class name ; nextPut:$[ ; nextPutAll: self name ; nextPut: $]
]

{ #category : #accessing }
JinModelObject >> privateLoadBodyObject [
	self subclassResponsibility
]

{ #category : #accessing }
JinModelObject >> project: aJinAccessProject [ 
	project := aJinAccessProject
]
