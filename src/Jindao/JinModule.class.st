"
I represent a regular module. 
I have some code defined in my self .
"
Class {
	#name : #JinModule,
	#superclass : #JinHandleObject,
	#instVars : [
		'code'
	],
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinModule >> acceptVisitor: aVisitor [
	aVisitor visitModule: self 
]

{ #category : #'as yet unclassified' }
JinModule >> code [
	self ensureIsLoaded.
	^ code
		ifNil: [ code := JinSourceCode new
				handle: loadedObjectHandle;
				yourself ]
]

{ #category : #'as yet unclassified' }
JinModule >> privateLoadObjectHandle [
	^ (project openModule: self) handle
]
