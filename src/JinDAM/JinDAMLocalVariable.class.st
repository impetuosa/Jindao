Class {
	#name : #JinDAMLocalVariable,
	#superclass : #JinDAMVariable,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMLocalVariable >> accept: aVisitor [  
	^ aVisitor visitLocalVariable: self.

]
