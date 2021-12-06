Class {
	#name : #JinDAMUIClass,
	#superclass : #JinDAMClass,
	#instVars : [
		'dataSource'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMUIClass >> dataSource [ 
	^ dataSource 
]

{ #category : #'as yet unclassified' }
JinDAMUIClass >> dataSource: aSource [

	dataSource := aSource
]

{ #category : #'as yet unclassified' }
JinDAMUIClass >> isFormOrReport [

	^ true
]
