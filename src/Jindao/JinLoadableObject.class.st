"
I am a handle object. I have a name and a PharoCOM handle. 
I have two faces. The closed (or meta face), and the loaded face. 
The loaded face is the one that has most of the description .
"
Class {
	#name : #JinLoadableObject,
	#superclass : #JinProtoObject,
	#instVars : [
		'project',
		'loadedObjectHandle'
	],
	#category : #'Jindao-DomainObjects-PrincipalObjects'
}

{ #category : #'as yet unclassified' }
JinLoadableObject >> ensureIsLoaded [
	self isLoaded
		ifFalse: [ self load ]
]

{ #category : #'as yet unclassified' }
JinLoadableObject >> isLoaded [
	^ loadedObjectHandle isNotNil
		and: [ handle propertyNamed: #IsLoaded ]
]

{ #category : #'as yet unclassified' }
JinLoadableObject >> load [
	loadedObjectHandle := self privateLoadObjectHandle
]

{ #category : #accessing }
JinLoadableObject >> name [
	^ handle propertyNamed: #Name
]

{ #category : #'as yet unclassified' }
JinLoadableObject >> privateLoadObjectHandle [
	self subclassResponsibility
]

{ #category : #accessing }
JinLoadableObject >> project: aProject [
	project := aProject
]
