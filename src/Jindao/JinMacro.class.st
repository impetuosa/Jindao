Class {
	#name : #JinMacro,
	#superclass : #JinHandleObject,
	#category : #'Jindao-DomainObjects-PrincipalObjects'
}

{ #category : #'as yet unclassified' }
JinMacro >> acceptVisitor: aVisitor [
	aVisitor visitMacro: self 
]

{ #category : #'as yet unclassified' }
JinMacro >> privateLoadObjectHandle [
	^ (project openMacro: self) handle
]
