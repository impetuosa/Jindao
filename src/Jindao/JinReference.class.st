Class {
	#name : #JinReference,
	#superclass : #JinHandleObject,
	#category : #'Jindao-DomainObjects-PrincipalObjects'
}

{ #category : #'as yet unclassified' }
JinReference >> acceptVisitor: aVisitor [ 
	aVisitor visitReference: self 
]
