Class {
	#name : #JinDAMModel,
	#superclass : #Object,
	#instVars : [
		'entities'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMModel >> entities [
	^ entities
]

{ #category : #'instance creation' }
JinDAMModel >> initialize [

	super initialize.
	entities := OrderedCollection new . 
]

{ #category : #'instance creation' }
JinDAMModel >> instantiate: aClass [

	| obj |
	obj := aClass new.
	entities add: obj.
	^ obj
]
