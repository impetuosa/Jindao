Class {
	#name : #MDDataContainer,
	#superclass : #MDDataResource,
	#instVars : [
		'elements'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
MDDataContainer >> addElement: aDataElement [ 
	aDataElement parent: self.
	elements add: aDataElement. 
]

{ #category : #'as yet unclassified' }
MDDataContainer >> elements [
	^ elements
]

{ #category : #'as yet unclassified' }
MDDataContainer >> initialize [ 
	super initialize. 
	elements := OrderedCollection new
]
