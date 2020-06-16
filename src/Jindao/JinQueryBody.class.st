Class {
	#name : #JinQueryBody,
	#superclass : #JinBodyObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinQueryBody >> sql [
	^ handle propertyNamed: #SQL
]
