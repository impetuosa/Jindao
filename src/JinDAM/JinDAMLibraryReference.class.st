Class {
	#name : #JinDAMLibraryReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'name'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMLibraryReference >> accept: aVisitor [  
	^ aVisitor visitLibraryReference: self.

]

{ #category : #testing }
JinDAMLibraryReference >> isVariableReference [
	^ candidate  isVariable 
]

{ #category : #accessing }
JinDAMLibraryReference >> name [
	^ name
]

{ #category : #accessing }
JinDAMLibraryReference >> name: aString [ 
	name := aString
]
