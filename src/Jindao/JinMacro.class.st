Class {
	#name : #JinMacro,
	#superclass : #JinModelObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinMacro >> acceptVisitor: aVisitor [
	aVisitor visitMacro: self 
]

{ #category : #accessing }
JinMacro >> privateLoadBodyObject [
	^ (project openMacro: self) 
]
