Class {
	#name : #JinDAMNewExpression,
	#superclass : #JinDAMEntity,
	#instVars : [
		'typeReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMNewExpression >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitNewExpression: self
]

{ #category : #accessing }
JinDAMNewExpression >> typeReference [
	^ typeReference
]

{ #category : #accessing }
JinDAMNewExpression >> typeReference: aJinDAMAccessRead [ 
	typeReference := aJinDAMAccessRead
]
