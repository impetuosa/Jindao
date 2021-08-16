Class {
	#name : #JinDAMVariable,
	#superclass : #JinDAMEntity,
	#instVars : [
		'typeReference',
		'name',
		'reads',
		'writes',
		'isConstant',
		'instantiatesObjectOnDefinition'
	],
	#category : #'JinDAM-Model'
}

{ #category : #initialization }
JinDAMVariable >> initialize [

	super initialize.
	reads := OrderedCollection new.
	writes := OrderedCollection new
]

{ #category : #'as yet unclassified' }
JinDAMVariable >> instantiatesObjectOnDefinition: aBoolean [

	instantiatesObjectOnDefinition := aBoolean
]

{ #category : #testing }
JinDAMVariable >> isConstant: aBoolean [

	isConstant := aBoolean
]

{ #category : #accessing }
JinDAMVariable >> name [
	^ name
]

{ #category : #accessing }
JinDAMVariable >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinDAMVariable >> typeReference: aJinDAMTypeReference [

	typeReference := aJinDAMTypeReference
]
