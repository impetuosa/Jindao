Class {
	#name : #MDRelationalTable,
	#superclass : #MDColumnSet,
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
MDRelationalTable >> accept: aVisitor [
	aVisitor visitRelationalTable: self
]
