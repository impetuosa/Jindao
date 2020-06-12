Class {
	#name : #JinReport,
	#superclass : #JinModelObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinReport >> acceptVisitor: aVisitor [
	aVisitor visitReport: self 
]

{ #category : #accessing }
JinReport >> privateLoadBodyObject [
	^ (project openReport: self)
]
