Class {
	#name : #JinDAMAccess,
	#superclass : #JinDAMEntity,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMAccess >> accept: aVisitor [  
	^ aVisitor visitAccess: self.

]
