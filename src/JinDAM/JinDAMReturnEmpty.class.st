Class {
	#name : #JinDAMReturnEmpty,
	#superclass : #JinDAMEntity,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMReturnEmpty >> accept: anAlceJinDAMPhase1Loader [

	^  anAlceJinDAMPhase1Loader visitReturnEmpty: self
]

{ #category : #visiting }
JinDAMReturnEmpty >> acceptVisitor: aVisitor [

	^ aVisitor visitReturnEmpty: self
]
