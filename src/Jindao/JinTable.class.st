Class {
	#name : #JinTable,
	#superclass : #JinModelObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinTable >> acceptVisitor: aVisitor [
	aVisitor visitTable: self 
]

{ #category : #accessing }
JinTable >> privateLoadBodyObject [
	^ (project openTable: self)
]
