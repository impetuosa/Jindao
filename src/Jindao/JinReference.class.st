Class {
	#name : #JinReference,
	#superclass : #JinAccessObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinReference >> acceptVisitor: aVisitor [ 
	aVisitor visitReference: self 
]

{ #category : #'as yet unclassified' }
JinReference >> isBroken [
	^ handle propertyNamed: #IsBroken
]

{ #category : #'as yet unclassified' }
JinReference >> name [
	^ handle propertyNamed:#Name 
]
