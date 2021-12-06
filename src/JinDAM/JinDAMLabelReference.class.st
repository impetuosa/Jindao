Class {
	#name : #JinDAMLabelReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'name'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMLabelReference >> accept: aVisitor [  
	^ aVisitor visitLabelReference: self.

]

{ #category : #accessing }
JinDAMLabelReference >> name [
	^ name
]

{ #category : #accessing }
JinDAMLabelReference >> name: aString [ 
	name := aString
]
