Class {
	#name : #MDRelationalTable,
	#superclass : #MDColumnSet,
	#instVars : [
		'indexes'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
MDRelationalTable >> accept: aVisitor [
	aVisitor visitRelationalTable: self
]

{ #category : #'as yet unclassified' }
MDRelationalTable >> addIndex: aMDIndex [
	indexes add: aMDIndex
]

{ #category : #'as yet unclassified' }
MDRelationalTable >> indexes [
	^ indexes
]

{ #category : #'as yet unclassified' }
MDRelationalTable >> initialize [
	super initialize.
	indexes := OrderedCollection new
]
