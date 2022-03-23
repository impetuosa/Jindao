Class {
	#name : #JinDAMUIClass,
	#superclass : #JinDAMClass,
	#instVars : [
		'dataSource',
		'defaultInstance'
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

{ #category : #accessing }
JinDAMUIClass >> defaultInstance [

	^ defaultInstance ifNil: [ defaultInstance := JinDAMObject new ]
]

{ #category : #'as yet unclassified' }
JinDAMUIClass >> isFormOrReport [

	^ true
]
