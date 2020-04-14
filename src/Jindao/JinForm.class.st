Class {
	#name : #JinForm,
	#superclass : #JinHandleObject,
	#instVars : [
		'code'
	],
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinForm >> code [
	self ensureIsLoaded.
	^ code
		ifNil: [ code := JinSourceCode new
				handle: loadedObjectHandle;
				yourself ]
]

{ #category : #'as yet unclassified' }
JinForm >> privateLoadObjectHandle [
	^ (project openForm: self) handle
]
