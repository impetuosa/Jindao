Class {
	#name : #JinCasinoAccessModelImporter,
	#superclass : #Object,
	#instVars : [
		'project',
		'importedModel',
		'importedProject',
		'errors'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
JinCasinoAccessModelImporter >> errors [
	^ errors
]

{ #category : #'as yet unclassified' }
JinCasinoAccessModelImporter >> import [
	| importer |
	importer := JinCasinoVisitor defaultNew.
	importer useModel: importedModel.
	project acceptVisitor: importer.
	errors := importer errors .
	importedProject := importer importedProject .
]

{ #category : #'as yet unclassified' }
JinCasinoAccessModelImporter >> import: aProject into: aModel [
	project := aProject.
	importedModel := aModel.
	self preImport.
	self import.
	self postImport
]

{ #category : #'as yet unclassified' }
JinCasinoAccessModelImporter >> importedProject [
	^ importedProject
]

{ #category : #'as yet unclassified' }
JinCasinoAccessModelImporter >> postImport [
	" Nothing todo  here yet "
]

{ #category : #'as yet unclassified' }
JinCasinoAccessModelImporter >> preImport [
	" Nothing yet "
]
