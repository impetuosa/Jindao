Class {
	#name : #JinDAMReturnEmpty,
	#superclass : #JinDAMEntity,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMReturnEmpty >> acceptVisitor: aVisitor [

	^ aVisitor visitReturnEmpty: self
]
