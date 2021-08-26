Class {
	#name : #JinDAMMultipleTypeReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'typeName',
		'dimensions'
	],
	#category : #'JinDAM-Model'
}

{ #category : #testing }
JinDAMMultipleTypeReference >> candidate [
	^ candidate 
	 "self error: 'Use (s)'"
]

{ #category : #testing }
JinDAMMultipleTypeReference >> candidate: aCandidateAnchor [
	 self error: 'Use Add'
]

{ #category : #testing }
JinDAMMultipleTypeReference >> candidateAnchor [
	 self error: 'Use (s)'
]

{ #category : #testing }
JinDAMMultipleTypeReference >> candidateAnchor: aCandidateAnchor [
	 self error: 'Use Add'
]

{ #category : #'as yet unclassified' }
JinDAMMultipleTypeReference >> candidateAnchors: aCollection [

	candidateAnchor := aCollection
]

{ #category : #testing }
JinDAMMultipleTypeReference >> isArray [ 
	 ^ self dimensions > 0 
]

{ #category : #testing }
JinDAMMultipleTypeReference >> isTypeReference [
	^ true
]

{ #category : #testing }
JinDAMMultipleTypeReference >> name [
	 ^ typeName 
]

{ #category : #testing }
JinDAMMultipleTypeReference >> typeName [

	^ typeName
]

{ #category : #testing }
JinDAMMultipleTypeReference >> typeName: aString [ 
	typeName := aString.

]
