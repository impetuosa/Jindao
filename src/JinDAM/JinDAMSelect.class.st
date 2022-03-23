Class {
	#name : #JinDAMSelect,
	#superclass : #JinDAMEntity,
	#instVars : [
		'expression',
		'cases'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMSelect >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitSelect: self
]

{ #category : #accessing }
JinDAMSelect >> cases [
	^ cases
]

{ #category : #accessing }
JinDAMSelect >> cases: aCollection [ 
	cases := aCollection
]

{ #category : #accessing }
JinDAMSelect >> expression [
	^ expression
]

{ #category : #accessing }
JinDAMSelect >> expression: aJinDAMAccessRead [ 
	expression := aJinDAMAccessRead
]
