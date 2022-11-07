Class {
	#name : #JinDAMLocalVariable,
	#superclass : #JinDAMVariable,
	#instVars : [
		'isStatic'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMLocalVariable >> accept: aVisitor [  
	^ aVisitor visitLocalVariable: self.

]

{ #category : #accessing }
JinDAMLocalVariable >> isStatic: aBool [

	isStatic := aBool
]
