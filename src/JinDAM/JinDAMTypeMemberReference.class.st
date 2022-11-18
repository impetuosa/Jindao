Class {
	#name : #JinDAMTypeMemberReference,
	#superclass : #JinDAMMemberReference,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMTypeMemberReference >> accept: aVisitor [

	^ aVisitor visitTypeMemberReference: self
]
