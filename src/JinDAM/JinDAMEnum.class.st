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

{ #category : #testing }
JinDAMEnum >> find: aJinNSKind named: aString [

	self assert: aJinNSKind isEnumEntry .
	^ values detect: [ :v | 
		  (v name compare: aString caseSensitive: false) = 2 ]
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
