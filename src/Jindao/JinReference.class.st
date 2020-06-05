Class {
	#name : #JinReference,
	#superclass : #JinLoadableObject,
	#category : #'Jindao-DomainObjects-PrincipalObjects'
}

{ #category : #'as yet unclassified' }
JinReference >> acceptVisitor: aVisitor [ 
	aVisitor visitReference: self 
]
