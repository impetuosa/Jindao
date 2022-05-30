Class {
	#name : #JinDAMResumeNext,
	#superclass : #JinDAMResumeEmpty,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMResumeNext >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitResumeNext: self
]
