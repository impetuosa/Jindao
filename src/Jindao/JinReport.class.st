Class {
	#name : #JinReport,
	#superclass : #JinHandleObject,
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinReport >> privateLoadObjectHandle [
	^ (project openReport: self) handle
]
