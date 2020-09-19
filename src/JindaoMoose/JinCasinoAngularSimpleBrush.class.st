Class {
	#name : #JinCasinoAngularSimpleBrush,
	#superclass : #Object,
	#instVars : [
		'tag'
	],
	#category : #JindaoMoose
}

{ #category : #'as yet unclassified' }
JinCasinoAngularSimpleBrush >> computeAttributesFor: aCSNElement [

	| extractor |
	extractor := JinAngularAttributesExtractor new.
	aCSNElement attributes do: [ :a | a accept: extractor ].

	^ extractor result
]

{ #category : #'as yet unclassified' }
JinCasinoAngularSimpleBrush >> computeBodyFor: aCSNUIElement [

	| cowriter |
	cowriter := JinAngularHtmlBodyComplementsCoWriter new.
	cowriter brush: self.
	aCSNUIElement attributes do: [ :a | a accept: cowriter ]
]

{ #category : #testing }
JinCasinoAngularSimpleBrush >> isParagraph [
	^ tag = 'p'
]

{ #category : #accessing }
JinCasinoAngularSimpleBrush >> tag: aString [ 
	tag := aString
]

{ #category : #writing }
JinCasinoAngularSimpleBrush >> write: aCSNUIParagraph into: aXMLWriter [

	aXMLWriter
		tag: tag
		attributes: (self computeAttributesFor: aCSNUIParagraph)
		with: [ 
		self writeBodyComplementsFor: aCSNUIParagraph into: aXMLWriter ]
]

{ #category : #writing }
JinCasinoAngularSimpleBrush >> write: aCSNUIPanel into: aXMLWriter with: aFullBlockClosure [

	aXMLWriter tag: tag with: [ aFullBlockClosure value ]
]

{ #category : #'as yet unclassified' }
JinCasinoAngularSimpleBrush >> writeBodyComplementsFor: aCSNUIElement into: aStream [ 

	| cowriter |
	cowriter := JinAngularHtmlBodyComplementsCoWriter new.
	cowriter brush: self stream: aStream.
	aCSNUIElement attributes do: [ :a | a accept: cowriter ]
]
