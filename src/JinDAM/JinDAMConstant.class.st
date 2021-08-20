Class {
	#name : #JinDAMConstant,
	#superclass : #JinDAMVariable,
	#instVars : [
		'value'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMConstant >> addAccess: aJinDAMAccessRead [

	value ifNil: [ 
		value := aJinDAMAccessRead.
		^ self ].
	value isCollection ifFalse: [ 
		value := OrderedCollection new
			         add: value;
			         yourself ].
	value add: aJinDAMAccessRead 
]
