"
I represent a macro at the first citizen level. 
"
Class {
	#name : #JinMacro,
	#superclass : #JinModelObject,
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinMacro class >> typeNumber [
	^ 4
]

{ #category : #'as yet unclassified' }
JinMacro >> acceptVisitor: aVisitor [
	aVisitor visitMacro: self 
]

{ #category : #accessing }
JinMacro >> color [
	^ Color blue darker 
]

{ #category : #accessing }
JinMacro >> privateLoadBodyObject [
	^ (project openMacro: self) 
]
