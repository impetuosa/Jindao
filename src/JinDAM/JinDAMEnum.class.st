Class {
	#name : #JinDAMEnum,
	#superclass : #JinDAMType,
	#instVars : [
		'values'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMEnum >> addEnumValue: aJinDAMEnumValue [

	self values add: aJinDAMEnumValue
]

{ #category : #accessing }
JinDAMEnum >> printOn: aStream [

	aStream
		nextPutAll: 'Enum ';
		nextPutAll: name
]

{ #category : #accessing }
JinDAMEnum >> values [

	^ values ifNil: [ values := OrderedCollection new ]
]
