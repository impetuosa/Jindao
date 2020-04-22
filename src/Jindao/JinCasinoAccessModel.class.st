Class {
	#name : #JinCasinoAccessModel,
	#superclass : #Object,
	#instVars : [
		'project',
		'importedModel'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'as yet unclassified' }
JinCasinoAccessModel >> createModelIn: aJinAccessProject [ 
	project := aJinAccessProject.
	self preImport.
	self import.
	self postImport.
	
]

{ #category : #'as yet unclassified' }
JinCasinoAccessModel >> import [
	|  importer |
	importer := JinCasinoVisitor new.
	project acceptVisitor: importer. 
	importedModel := importer importedProject 
]

{ #category : #'as yet unclassified' }
JinCasinoAccessModel >> preImport [
	" Nothing yet "
]
