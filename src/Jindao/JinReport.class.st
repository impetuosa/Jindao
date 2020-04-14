Class {
	#name : #JinReport,
	#superclass : #JinHandleObject,
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinReport >> privateLoadObjectHandle [
	^ (project openReport: self) handle
]
