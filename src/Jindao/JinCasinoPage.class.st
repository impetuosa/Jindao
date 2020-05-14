Class {
	#name : #JinCasinoPage,
	#superclass : #CSNPage,
	#instVars : [
		'project'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'as yet unclassified' }
JinCasinoPage >> project [
	^ project
]

{ #category : #accessing }
JinCasinoPage >> project: aJinCasinoProject [ 
	project := aJinCasinoProject.
	mooseModel := aJinCasinoProject model .
	aJinCasinoProject addPage: self. 
]
