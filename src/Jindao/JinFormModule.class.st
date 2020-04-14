"
I am a module attached to a form. 
I do not belong to the main collection of modules accessible in project/ application.
I am only accessible through a form 
"
Class {
	#name : #JinFormModule,
	#superclass : #JinModule,
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinFormModule >> ensureIsLoaded [
	self isLoaded ifFalse: [ self error: ' A form module is mean to be loaded by the form owner ' ].
]

{ #category : #'as yet unclassified' }
JinFormModule >> isLoaded [
	^ loadedObjectHandle isNotNil
]

{ #category : #'as yet unclassified' }
JinFormModule >> moduleHandle: aHandle project: aProject [
	loadedObjectHandle := aHandle .
	self project: aProject
]

{ #category : #'as yet unclassified' }
JinFormModule >> name [
	^ loadedObjectHandle  propertyNamed: #Name
]
