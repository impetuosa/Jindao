Class {
	#name : #JinDAMDataSource,
	#superclass : #JinDAMClass,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMDataSource >> accept: aVisitor [  
	^ aVisitor visitDataSource: self.

]
