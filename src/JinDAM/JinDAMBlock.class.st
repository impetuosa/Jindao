Class {
	#name : #JinDAMBlock,
	#superclass : #JinDAMEntity,
	#instVars : [
		'statements'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMBlock >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitBlock: self
]

{ #category : #initialization }
JinDAMBlock >> initialize [ 	
	super initialize.
	statements := OrderedCollection new 
]

{ #category : #accessing }
JinDAMBlock >> statements [
	^ statements
]

{ #category : #accessing }
JinDAMBlock >> statements: aCollection [ 
	statements := aCollection
]
