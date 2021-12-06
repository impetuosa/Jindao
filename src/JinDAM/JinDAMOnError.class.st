Class {
	#name : #JinDAMOnError,
	#superclass : #JinDAMEntity,
	#instVars : [
		'do'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMOnError >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitOnError: self
]

{ #category : #accessing }
JinDAMOnError >> do: aJinDAMGoTo [ 
	do := aJinDAMGoTo
]
