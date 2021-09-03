Class {
	#name : #JinDAMMultipleTypeReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'typeName',
		'dimensions'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMMultipleTypeReference >> accept: aVisitor [  
	^ aVisitor visitMultipleTypeReference: self.

]

{ #category : #testing }
JinDAMMultipleTypeReference >> candidate [

	^ candidate 
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
JinDAMMultipleTypeReference >> candidates [

	^ candidate ifNil: [ "self error: 'Use (s)'" {  } ]
]

{ #category : #testing }
JinDAMMultipleTypeReference >> isArray [ 
	 ^ self dimensions > 0 
]

{ #category : #testing }
JinDAMMultipleTypeReference >> isMultipleReference [
	
	^ true
]

{ #category : #testing }
JinDAMMultipleTypeReference >> isTypeReference [
	^ true
]

{ #category : #'as yet unclassified' }
JinDAMMultipleTypeReference >> isUnknownReference [

	^ candidate isEmptyOrNil
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
