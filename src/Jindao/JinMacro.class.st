Class {
	#name : #JinMacro,
	#superclass : #JinHandleObject,
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinMacro >> privateLoadObjectHandle [
	^ (project openMacro: self) handle
]
