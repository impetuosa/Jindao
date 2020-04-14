Class {
	#name : #JinQuery,
	#superclass : #JinHandleObject,
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinQuery >> privateLoadObjectHandle [
	^ (project openQuery: self) handle
]
