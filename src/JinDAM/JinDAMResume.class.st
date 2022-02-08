Class {
	#name : #JinDAMResume,
	#superclass : #JinDAMResumeEmpty,
	#instVars : [
		'strategy',
		'destination'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMResume >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitResume: self
]

{ #category : #accessing }
JinDAMResume >> destination [
	^ destination
]

{ #category : #accessing }
JinDAMResume >> destination: aCollection [

	destination := aCollection
]
