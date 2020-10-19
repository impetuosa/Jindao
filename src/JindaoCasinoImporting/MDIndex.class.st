Class {
	#name : #MDIndex,
	#superclass : #MDDataContainer,
	#instVars : [
		'kind'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #accessing }
MDIndex >> addElement: anElement [
	self halt: ' Maybe is not a good idea. super addElement changes the parent. here we add columns, that belong to a table and not to the index '
]

{ #category : #accessing }
MDIndex >> elements: columns [
	elements := columns
]

{ #category : #'as yet unclassified' }
MDIndex >> kind: aString [ 
	kind := aString
]
