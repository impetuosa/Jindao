Class {
	#name : #JinQuery,
	#superclass : #JinModelObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinQuery >> acceptVisitor: aVisitor [
	aVisitor visitQuery: self 
]

{ #category : #accessing }
JinQuery >> privateLoadBodyObject [
	^ (project openQuery: self)
]
