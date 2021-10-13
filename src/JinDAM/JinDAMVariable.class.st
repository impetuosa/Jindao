Class {
	#name : #JinDAMVariable,
	#superclass : #JinDAMEntity,
	#instVars : [
		'typeReference',
		'name',
		'reads',
		'writes',
		'isConstant',
		'instantiatesObjectOnDefinition',
		'redimText'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMVariable >> accept: aVisitor [  
	^ aVisitor visitVariable: self.

]

{ #category : #initialization }
JinDAMVariable >> initialize [

	super initialize.
	reads := OrderedCollection new.
	writes := OrderedCollection new
]

{ #category : #'\\' }
JinDAMVariable >> instantiatesObjectOnDefinition [
	^ instantiatesObjectOnDefinition
]

{ #category : #'as yet unclassified' }
JinDAMVariable >> instantiatesObjectOnDefinition: aBoolean [

	instantiatesObjectOnDefinition := aBoolean
]

{ #category : #accessing }
JinDAMVariable >> isConstant [
	^ isConstant
]

{ #category : #testing }
JinDAMVariable >> isConstant: aBoolean [

	isConstant := aBoolean
]

{ #category : #testing }
JinDAMVariable >> isVariable [
	 ^ true 
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
JinDAMVariable >> parametersSize [

	^ typeReference dimensions
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

{ #category : #'as yet unclassified' }
JinDAMVariable >> redim: aString [ 
	redimText := aString 
]

{ #category : #generated }
JinDAMVariable >> type [
	 ^ typeReference candidate 
]

{ #category : #accessing }
JinDAMVariable >> typeReference [
	^ typeReference
]

{ #category : #accessing }
JinDAMVariable >> typeReference: aJinDAMTypeReference [

	typeReference := aJinDAMTypeReference
]
