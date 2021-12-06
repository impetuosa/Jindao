Class {
	#name : #JinDAMParameter,
	#superclass : #JinDAMVariable,
	#instVars : [
		'isOptional'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMParameter >> accept: aVisitor [  
	^ aVisitor visitParameter: self.

]

{ #category : #accessing }
JinDAMParameter >> isOptional [
	^ isOptional
]

{ #category : #accessing }
JinDAMParameter >> isOptional: aBoolean [

	isOptional := aBoolean
]
