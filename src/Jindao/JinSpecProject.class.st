Class {
	#name : #JinSpecProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'forms'
	],
	#category : #'Jindao-Spec-Exporter'
}

{ #category : #'as yet unclassified' }
JinSpecProject >> addForm: aForm [
	forms add: aForm
]

{ #category : #'as yet unclassified' }
JinSpecProject >> initialize [ 
	super initialize. 
	forms := Set new 
]

{ #category : #'as yet unclassified' }
JinSpecProject >> name: aString [ 
	name := aString 
]
