Class {
	#name : #JinForm,
	#superclass : #JinHandleObject,
	#instVars : [
		'code',
		'module'
	],
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinForm >> code [
	^ self module code 
]

{ #category : #'as yet unclassified' }
JinForm >> module [
	self ensureIsLoaded.
	^ module
		ifNil: [ module := JinFormModule new
				moduleHandle: (loadedObjectHandle propertyNamed: #Module) project: project;
				yourself ]
]

{ #category : #'as yet unclassified' }
JinForm >> privateLoadObjectHandle [
	^ (project openForm: self) handle
]
