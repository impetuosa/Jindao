Class {
	#name : #JinPage,
	#superclass : #CSNPage,
	#instVars : [
		'project'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'as yet unclassified' }
JinPage >> project [
	^ project
]

{ #category : #accessing }
JinPage >> project: aJinCasinoProject [ 
	project := aJinCasinoProject.
	mooseModel := aJinCasinoProject model .
	aJinCasinoProject addPage: self. 
]
