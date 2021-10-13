Class {
	#name : #JinDAMControl,
	#superclass : #JinDAMAttribute,
	#instVars : [
		'dataSource'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMControl >> accept: aVisitor [  
	^ aVisitor visitControl: self.

]

{ #category : #accessing }
JinDAMControl >> dataSource: aString [

	dataSource := aString
]
