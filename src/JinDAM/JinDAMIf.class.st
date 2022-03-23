Class {
	#name : #JinDAMIf,
	#superclass : #JinDAMEntity,
	#instVars : [
		'condition',
		'ifTrue',
		'ifFalse'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMIf >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitIf: self
]

{ #category : #accessing }
JinDAMIf >> condition [
	^ condition
]

{ #category : #accessing }
JinDAMIf >> condition: aJinDAMUnaryOperation [ 
	condition := aJinDAMUnaryOperation
]

{ #category : #accessing }
JinDAMIf >> ifFalse [
	^ ifFalse
]

{ #category : #accessing }
JinDAMIf >> ifFalse: aJinDAMBlock [ 
	ifFalse := aJinDAMBlock
]

{ #category : #accessing }
JinDAMIf >> ifTrue [
	^ ifTrue
]

{ #category : #accessing }
JinDAMIf >> ifTrue: aJinDAMBlock [ 
	ifTrue := aJinDAMBlock
]
