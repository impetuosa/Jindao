Class {
	#name : #JinQuery,
	#superclass : #JinHandleObject,
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinQuery >> privateLoadObjectHandle [
	^ (project openQuery: self) handle
]
