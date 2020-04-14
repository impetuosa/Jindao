Class {
	#name : #JinModule,
	#superclass : #JinHandleObject,
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinModule >> code [
	self ensureIsLoaded.

	self halt. 
]

{ #category : #'as yet unclassified' }
JinModule >> load [
	handle := (project openModule: self) handle
]
