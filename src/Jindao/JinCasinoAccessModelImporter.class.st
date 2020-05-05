Class {
	#name : #JinCasinoAccessModelImporter,
	#superclass : #Object,
	#instVars : [
		'project',
		'importedModel',
		'importedProject'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'as yet unclassified' }
JinCasinoAccessModelImporter >> import [
	| importer |
	importer := JinCasinoVisitor new.
	importer useModel: importedModel.
	project acceptVisitor: importer.
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
