Class {
	#name : #JinReference,
	#superclass : #JinHandleObject,
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinReference >> acceptVisitor: aVisitor [ 
	aVisitor visitReference: self 
]
