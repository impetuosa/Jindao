Class {
	#name : #JinDAMEnumValue,
	#superclass : #JinDAMEntity,
	#instVars : [
		'name',
		'value'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMEnumValue >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinDAMEnumValue >> value [

	^ value
]

{ #category : #accessing }
JinDAMEnumValue >> value: anInteger [ 
	value := anInteger
]
