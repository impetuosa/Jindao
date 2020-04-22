Class {
	#name : #JinCasinoProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'pages'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #adding }
JinCasinoProject >> addPage: aJinPage [ 
	pages add: aJinPage
]

{ #category : #accessing }
JinCasinoProject >> initialize [
	super initialize.
	pages := Set new
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> name [
	^ name
]

{ #category : #accessing }
JinCasinoProject >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinCasinoProject >> pages [
	^ pages 
]
