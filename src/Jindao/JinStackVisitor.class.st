"
I am a massive visitor. I can visit what ever in an access system . i add push:during for subclasses to be able to scope visiting 
"
Class {
	#name : #JinStackVisitor,
	#superclass : #JinVisitor,
	#instVars : [
		'stack'
	],
	#category : #'Jindao-Core'
}

{ #category : #initialization }
JinStackVisitor >> initialize [
	super initialize.
	stack := Stack new
]

{ #category : #initialization }
JinStackVisitor >> push: aValue during: aBlock [
	stack push: aValue.
	aBlock
		ensure: [ stack pop ]
]
