Class {
	#name : #JinTable,
	#superclass : #JinHandleObject,
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinTable >> privateLoadObjectHandle [
	^ (project openTable: self) handle
]
