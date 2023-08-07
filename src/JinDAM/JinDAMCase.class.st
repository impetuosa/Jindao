"
I represent a case. I am to be found within a SELECT.
(this is equivalent, switch case )
"
Class {
	#name : #JinDAMCase,
	#superclass : #JinDAMEntity,
	#instVars : [
		'block',
		'expressions'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMCase >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitSelectCase: self
]

{ #category : #accessing }
JinDAMCase >> block [
	^ block
]

{ #category : #accessing }
JinDAMCase >> block: aJinDAMBlock [ 
	block := aJinDAMBlock
]

{ #category : #generated }
JinDAMCase >> expression [
	self shouldBeImplemented.
]

{ #category : #accessing }
JinDAMCase >> expressions [
	^ expressions
]

{ #category : #generated }
JinDAMCase >> expressions: aCollection [

	expressions := aCollection
]
