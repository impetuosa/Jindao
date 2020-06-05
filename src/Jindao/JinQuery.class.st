Class {
	#name : #JinQuery,
	#superclass : #JinLoadableObject,
	#category : #'Jindao-DomainObjects-PrincipalObjects'
}

{ #category : #'as yet unclassified' }
JinQuery >> acceptVisitor: aVisitor [
	aVisitor visitQuery: self 
]

{ #category : #'as yet unclassified' }
JinQuery >> privateLoadObjectHandle [
	^ (project openQuery: self) handle
]
