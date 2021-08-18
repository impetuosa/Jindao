Class {
	#name : #JinDAMLibraryReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'name'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMLibraryReference >> name [
	^ name
]

{ #category : #accessing }
JinDAMLibraryReference >> name: aString [ 
	name := aString
]
