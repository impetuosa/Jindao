Class {
	#name : #JinDAMControl,
	#superclass : #JinDAMAttribute,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMControl >> accept: aVisitor [  
	^ aVisitor visitControl: self.

]
