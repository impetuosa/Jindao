Class {
	#name : #JinCasinoProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'pages',
		'model'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'as yet unclassified' }
JinCasinoProject >> add: aCSNBusinessPage [
	self addPage: aCSNBusinessPage.
	^ aCSNBusinessPage
]

{ #category : #adding }
JinCasinoProject >> addPage: aJinPage [ 
	pages add: aJinPage.
	model add: aJinPage 
]

{ #category : #accessing }
JinCasinoProject >> initialize [
	super initialize.
	pages := Set new.
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> model [
	^ model
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> model: aModel [ 
	^ model := aModel 
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
