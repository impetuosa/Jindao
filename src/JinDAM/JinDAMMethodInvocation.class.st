Class {
	#name : #JinDAMMethodInvocation,
	#superclass : #JinDAMMemberReference,
	#instVars : [
		'receiver'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMMethodInvocation >> receiver: aJinDAMTypeReference [ 
	receiver := aJinDAMTypeReference
]
