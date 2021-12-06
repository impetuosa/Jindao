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
JinDAMCase >> block: aJinDAMBlock [ 
	block := aJinDAMBlock
]

{ #category : #generated }
JinDAMCase >> expressions: aCollection [

	expressions := aCollection
]
