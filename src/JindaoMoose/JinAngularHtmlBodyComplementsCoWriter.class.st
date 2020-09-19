Class {
	#name : #JinAngularHtmlBodyComplementsCoWriter,
	#superclass : #Object,
	#instVars : [
		'brush',
		'writer'
	],
	#category : #JindaoMoose
}

{ #category : #'as yet unclassified' }
JinAngularHtmlBodyComplementsCoWriter >> brush: aJinCasinoAngularSimpleBrush stream: aXMLWriter [ 
	brush := aJinCasinoAngularSimpleBrush .
	writer := aXMLWriter 
]

{ #category : #visiting }
JinAngularHtmlBodyComplementsCoWriter >> visitCSNAttribute: aCSNUITop [ 
		" Nothing to do here "
]

{ #category : #visiting }
JinAngularHtmlBodyComplementsCoWriter >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [

	" Nothing to do here "

	
]

{ #category : #visiting }
JinAngularHtmlBodyComplementsCoWriter >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	" Nothing to do here "
]

{ #category : #visiting }
JinAngularHtmlBodyComplementsCoWriter >> visitCSNUILabel: aCSNUILabel [ 
	self assert: brush isParagraph.
	writer string: aCSNUILabel attributeValue.	
	
]
