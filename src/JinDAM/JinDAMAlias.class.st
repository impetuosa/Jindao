Class {
	#name : #JinDAMAlias,
	#superclass : #JinDAMType,
	#instVars : [
		'typeReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMAlias >> type [ 
	^ typeReference value 
]

{ #category : #accessing }
JinDAMAlias >> typeReference: aJinDAMPrimitiveType [ 
	typeReference := aJinDAMPrimitiveType
]
