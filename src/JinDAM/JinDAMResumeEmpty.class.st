Class {
	#name : #JinDAMResumeEmpty,
	#superclass : #JinDAMEntity,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMResumeEmpty >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitResumeEmpty: self
]
