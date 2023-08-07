"
I represent a on error resume next  statement 
"
Class {
	#name : #JinDAMOnErrorResumeNext,
	#superclass : #JinDAMEntity,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMOnErrorResumeNext >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitOnErrorResumeNext: self
]
