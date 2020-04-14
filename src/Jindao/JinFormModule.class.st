Class {
	#name : #JinFormModule,
	#superclass : #JinModule,
	#category : #Jindao
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
