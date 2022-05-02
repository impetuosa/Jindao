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
