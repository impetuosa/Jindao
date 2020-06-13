Class {
	#name : #JinCasinoPage,
	#superclass : #CSNPage,
	#instVars : [
		'project'
	],
	#category : #JindaoCasinoImporting
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
