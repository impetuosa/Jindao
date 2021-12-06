Class {
	#name : #JinDAMWith,
	#superclass : #JinDAMEntity,
	#instVars : [
		'with',
		'block'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMWith >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitWith: self
]

{ #category : #accessing }
JinDAMWith >> block: aJinDAMBlock [ 
	block := aJinDAMBlock
]

{ #category : #accessing }
JinDAMWith >> with: aJinDAMAccessRead [ 
	with := aJinDAMAccessRead
]
