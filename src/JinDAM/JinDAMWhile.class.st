Class {
	#name : #JinDAMWhile,
	#superclass : #JinDAMLoop,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMWhile >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitWhile: self
]
