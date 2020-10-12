Class {
	#name : #MDDataEntity,
	#superclass : #MooseEntity,
	#instVars : [
		'parent'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
MDDataEntity >> accept: aVisitor [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MDDataEntity >> parent [
	^ parent
]

{ #category : #'as yet unclassified' }
MDDataEntity >> parent: aParent [ 
	parent := aParent 
]
