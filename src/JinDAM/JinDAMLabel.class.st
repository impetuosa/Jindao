Class {
	#name : #JinDAMLabel,
	#superclass : #JinDAMEntity,
	#instVars : [
		'labelName'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMLabel >> accept: anAlceJinDAMPhase1Loader [

	" nothing to do "

	
]

{ #category : #accessing }
JinDAMLabel >> labelName: aString [ 
	labelName := aString
]
