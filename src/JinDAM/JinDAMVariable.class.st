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

{ #category : #'as yet unclassified' }
JinDAMVariable >> printOn: aStream [

	typeReference printOn: aStream.
	aStream
		nextPutAll: ':';
		nextPutAll: (self className copyReplaceAll: 'JinDAM' with: '');
		nextPutAll: ':';
		nextPutAll: name
]

{ #category : #accessing }
JinDAMVariable >> typeReference: aJinDAMTypeReference [

	typeReference := aJinDAMTypeReference
]
