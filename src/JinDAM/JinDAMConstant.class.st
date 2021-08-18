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

	self assert: value isNil.
	value := aJinDAMAccessRead
]
