Class {
	#name : #JinDAMGoTo,
	#superclass : #JinDAMEntity,
	#instVars : [
		'labels'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMGoTo >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitGoTo: self
]

{ #category : #accessing }
JinDAMGoTo >> labels: aCollection [ 
	labels := aCollection
]
