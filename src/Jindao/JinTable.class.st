Class {
	#name : #JinTable,
	#superclass : #JinHandleObject,
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinTable >> acceptVisitor: aVisitor [
	aVisitor visitTable: self 
]

{ #category : #'as yet unclassified' }
JinTable >> privateLoadObjectHandle [
	^ (project openTable: self) handle
]
