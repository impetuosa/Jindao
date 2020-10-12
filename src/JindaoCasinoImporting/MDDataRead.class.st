Class {
	#name : #MDDataRead,
	#superclass : #MDDataAccess,
	#instVars : [
		'reader'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
MDDataRead >> accept: aVisitor [
	aVisitor visitDataRead: self
]

{ #category : #'as yet unclassified' }
MDDataRead >> addReader: aModel [ 
	reader add: aModel 
]

{ #category : #initialization }
MDDataRead >> initialize [ 
	super initialize .
	reader := Set new. 
]
