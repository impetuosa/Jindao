Class {
	#name : #JinDAMVariable,
	#superclass : #JinDAMEntity,
	#instVars : [
		'type',
		'name',
		'reads',
		'writes'
	],
	#category : #'JinDAM-Model'
}

{ #category : #initialization }
JinDAMVariable >> initialize [

	super initialize.
	reads := OrderedCollection new.
	writes := OrderedCollection new
]
