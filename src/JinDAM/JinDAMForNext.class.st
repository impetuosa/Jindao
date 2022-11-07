Class {
	#name : #JinDAMForNext,
	#superclass : #JinDAMLoop,
	#instVars : [
		'counter',
		'initialValue',
		'limit'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMForNext >> accept: anAlceJinDAMPhase1Loader [

	^ anAlceJinDAMPhase1Loader visitForNext: self
]

{ #category : #accessing }
JinDAMForNext >> counter [
	^ counter
]

{ #category : #accessing }
JinDAMForNext >> counter: aJinDAMAccessRead [ 
	counter := aJinDAMAccessRead
]

{ #category : #accessing }
JinDAMForNext >> initialValue [
	^ initialValue
]

{ #category : #accessing }
JinDAMForNext >> initialValue: aJinDAMAccessRead [ 
	initialValue := aJinDAMAccessRead
]

{ #category : #accessing }
JinDAMForNext >> limit [
	^ limit
]

{ #category : #accessing }
JinDAMForNext >> limit: aJinDAMAccessRead [ 
	limit := aJinDAMAccessRead
]
