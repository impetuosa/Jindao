Class {
	#name : #JinCasinoAngularMapper,
	#superclass : #Object,
	#instVars : [
		'mapping',
		'brush'
	],
	#category : #JindaoMoose
}

{ #category : #accessing }
JinCasinoAngularMapper class >> default [
	^ self new 
]

{ #category : #'as yet unclassified' }
JinCasinoAngularMapper >> brushFor: aCSNUIPanel [ 
	
	aCSNUIPanel accept: self.
	^ brush 

]

{ #category : #'as yet unclassified' }
JinCasinoAngularMapper >> initialize [

	super initialize.
	mapping := Dictionary new.
	self loadDefaults
]

{ #category : #'as yet unclassified' }
JinCasinoAngularMapper >> loadDefaults [ 
	
]

{ #category : #visiting }
JinCasinoAngularMapper >> visitCSNLAbsolutePositionLayout: aCSNLAbsolutePositionLayout [

	brush := JinCasinoAngularTabulatingLayoutBrush new
]

{ #category : #visiting }
JinCasinoAngularMapper >> visitCSNLTabulateLayout: aCSNLTabulateLayout [

	brush := JinCasinoAngularTabulatingLayoutBrush new
]

{ #category : #visiting }
JinCasinoAngularMapper >> visitCSNUIInputText: aCSNUIInputText [

	brush := JinCasinoAngularSimpleBrush new
		         tag: 'input';
		         yourself
]

{ #category : #visiting }
JinCasinoAngularMapper >> visitCSNUIPanel: aCSNUIPanel [

	brush := JinCasinoAngularSimpleBrush new
		         tag: 'div';
		         yourself
]

{ #category : #visiting }
JinCasinoAngularMapper >> visitCSNUIParagraph: aCSNUIParagraph [

	brush :=  JinCasinoAngularSimpleBrush new
		  tag: 'p';
		  yourself
]
