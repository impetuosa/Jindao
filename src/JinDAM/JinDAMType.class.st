Class {
	#name : #JinDAMType,
	#superclass : #JinDAMEntity,
	#instVars : [
		'visibility',
		'name'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMType >> name [
	^ name
]

{ #category : #accessing }
JinDAMType >> name: aString [ 
	name := aString
]

{ #category : #generated }
JinDAMType >> type [

	^ self
]