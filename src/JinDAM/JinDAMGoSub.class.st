Class {
	#name : #JinDAMGoSub,
	#superclass : #JinDAMEntity,
	#instVars : [
		'label'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMGoSub >> accept: aVisitor [

	^ aVisitor visitGoSub: self
]

{ #category : #accessing }
JinDAMGoSub >> label [
	^ label
]

{ #category : #accessing }
JinDAMGoSub >> label: aLabel [ 
	label := aLabel
]
