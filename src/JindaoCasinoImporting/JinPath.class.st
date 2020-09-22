Class {
	#name : #JinPath,
	#superclass : #ProtoObject,
	#instVars : [
		'parent',
		'object',
		'message'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
JinPath class >> __NOT_POSSIBLE_TO_RECOVER [
	^ self error: ' This is a root object! What do we do? '
]

{ #category : #'as yet unclassified' }
JinPath class >> object: anObject obtainedBySending: aMessage to: aParent [

	| instance |
	instance := self new.
	(self slotNamed: #object) write: anObject to: instance.
	(self slotNamed: #message) write: aMessage to: instance.
	(self slotNamed: #parent) write: aParent to: instance.
	^ instance 
]

{ #category : #'reflective operations' }
JinPath >> doesNotUnderstand: aMessage [

	| value |
	[ value := aMessage sendTo: object ]
		on: Win32Error
		do: [ 
			object := message sendTo: parent.
			value := aMessage sendTo: object ].
	^ (value class package name beginsWith: 'Jin')
		  ifTrue: [ 
		  JinPath object: value obtainedBySending: aMessage  to: self ]
		  ifFalse: [ value ]
]
