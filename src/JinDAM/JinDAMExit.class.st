"
I represent the exit statement. 
"
Class {
	#name : #JinDAMExit,
	#superclass : #JinDAMEntity,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMExit >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitExit: self
]
