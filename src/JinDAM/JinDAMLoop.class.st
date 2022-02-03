Class {
	#name : #JinDAMLoop,
	#superclass : #JinDAMEntity,
	#instVars : [
		'condition',
		'block'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMLoop >> block: aJinDAMBlock [ 
	block := aJinDAMBlock
]

{ #category : #accessing }
JinDAMLoop >> condition: aJinDAMUnaryOperation [ 
	condition := aJinDAMUnaryOperation
]
