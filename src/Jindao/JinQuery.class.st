Class {
	#name : #JinQuery,
	#superclass : #JinHandleObject,
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinQuery >> acceptVisitor: aVisitor [
	aVisitor visitQuery: self 
]

{ #category : #'as yet unclassified' }
JinQuery >> privateLoadObjectHandle [
	^ (project openQuery: self) handle
]
