Class {
	#name : #JinDAMUserType,
	#superclass : #JinDAMType,
	#instVars : [
		'attributes'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMUserType >> addAttribute: aJinDAMAttribute [ 
	self attributes add:aJinDAMAttribute
]

{ #category : #adding }
JinDAMUserType >> attributes [

	^ attributes ifNil: [ attributes := OrderedCollection new ]
]
