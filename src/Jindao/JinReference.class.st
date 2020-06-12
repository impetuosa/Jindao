Class {
	#name : #JinReference,
	#superclass : #JinAccessObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinReference >> acceptVisitor: aVisitor [ 
	aVisitor visitReference: self 
]
