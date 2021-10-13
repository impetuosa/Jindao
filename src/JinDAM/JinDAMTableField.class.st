Class {
	#name : #JinDAMTableField,
	#superclass : #JinDAMVariable,
	#instVars : [
		'sourceTableName',
		'size'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMTableField >> accept: aVisitor [  
	^ aVisitor visitTableField: self.

]

{ #category : #accessing }
JinDAMTableField >> size [
 	^ size 
]

{ #category : #accessing }
JinDAMTableField >> size: anInteger [ 
	size := anInteger
]

{ #category : #accessing }
JinDAMTableField >> sourceTableName: aString [ 
	sourceTableName := aString
]
