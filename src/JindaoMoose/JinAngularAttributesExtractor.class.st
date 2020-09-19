Class {
	#name : #JinAngularAttributesExtractor,
	#superclass : #Object,
	#instVars : [
		'attributes'
	],
	#category : #JindaoMoose
}

{ #category : #visiting }
JinAngularAttributesExtractor >> initialize [ 
	super initialize. 
	attributes := Dictionary new 
]

{ #category : #'as yet unclassified' }
JinAngularAttributesExtractor >> registerNameValueElement: aCSNUIElement [

	| value |
	self assert: (aCSNUIElement attributeValue isString or: [ 
			 aCSNUIElement attributeValue isNumber ]).
	value := aCSNUIElement attributeValue isFraction
		         ifTrue: [ aCSNUIElement attributeValue asFloat asString ]
		         ifFalse: [ aCSNUIElement attributeValue asString ].

	attributes at: aCSNUIElement name put: value
]

{ #category : #accessing }
JinAngularAttributesExtractor >> result [

	^ attributes
]

{ #category : #visiting }
JinAngularAttributesExtractor >> visitCSNAttribute: aCSNUITop [ 
	self registerNameValueElement: aCSNUITop 
]

{ #category : #visiting }
JinAngularAttributesExtractor >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [ 
	self registerNameValueElement: aCSNUIAbsoluteHeight
]

{ #category : #visiting }
JinAngularAttributesExtractor >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	self registerNameValueElement: aCSNUIAbsoluteWidth.
	
]

{ #category : #visiting }
JinAngularAttributesExtractor >> visitCSNUILabel: aCSNUILabel [ 
	" Label is not mapped to an attribute, but to a body. "
]
