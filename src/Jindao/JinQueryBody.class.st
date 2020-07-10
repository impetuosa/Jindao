"
I do represent the body of a query. I can get the sql definition 
"
Class {
	#name : #JinQueryBody,
	#superclass : #JinBodyObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinQueryBody >> sql [
	^ handle propertyNamed: #SQL
]
