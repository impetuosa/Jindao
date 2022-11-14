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

	^ anAlceJinDAMPhase1Loader visitLabel: self
]

{ #category : #accessing }
JinDAMLabel >> labelName [
	^ labelName
]

{ #category : #accessing }
JinDAMLabel >> labelName: aString [ 
	labelName := aString
]
