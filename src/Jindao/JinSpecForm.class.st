Class {
	#name : #JinSpecForm,
	#superclass : #SpDynamicPresenter,
	#instVars : [
		'name',
		'project'
	],
	#category : #'Jindao-Spec-Exporter'
}

{ #category : #'as yet unclassified' }
JinSpecForm >> addControl: aPresenter named: aName [ 
	self assign: aPresenter to: aName

]

{ #category : #'as yet unclassified' }
JinSpecForm >> name: aString [ 
	name := aString
]

{ #category : #'as yet unclassified' }
JinSpecForm >> open [
	layout := SpBoxLayout newVertical .
	presenters keys do: [ :k | layout add: k ].
	self openWithSpecLayout: layout
]

{ #category : #'as yet unclassified' }
JinSpecForm >> project: aJinSpecProject [ 
	project := aJinSpecProject.
	aJinSpecProject addForm: self. 
]
