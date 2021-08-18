Class {
	#name : #JinDAMTableField,
	#superclass : #JinDAMVariable,
	#instVars : [
		'sourceTableName',
		'size'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMTableField >> size: anInteger [ 
	size := anInteger
]

{ #category : #accessing }
JinDAMTableField >> sourceTableName: aString [ 
	sourceTableName := aString
]
