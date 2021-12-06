Class {
	#name : #JinDAMStructure,
	#superclass : #JinDAMUserType,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMStructure >> accept: aVisitor [  
	^ aVisitor visitStructure: self.

]
