Class {
	#name : #JinReport,
	#superclass : #JinHandleObject,
	#category : #'Jindao-DomainObjects-PrincipalObjects'
}

{ #category : #'as yet unclassified' }
JinReport >> acceptVisitor: aVisitor [
	aVisitor visitReport: self 
]

{ #category : #'as yet unclassified' }
JinReport >> privateLoadObjectHandle [
	^ (project openReport: self) handle
]
