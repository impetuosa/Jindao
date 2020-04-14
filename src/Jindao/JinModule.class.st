Class {
	#name : #JinModule,
	#superclass : #JinHandleObject,
	#instVars : [
		'code'
	],
	#category : #Jindao
}

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
