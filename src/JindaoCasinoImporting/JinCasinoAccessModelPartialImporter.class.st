Class {
	#name : #JinCasinoAccessModelPartialImporter,
	#superclass : #Object,
	#instVars : [
		'items',
		'importedModel',
		'importedProject',
		'errors'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #importing }
JinCasinoAccessModelPartialImporter >> errors [
	^ errors
]

{ #category : #importing }
JinCasinoAccessModelPartialImporter >> import [

	| importer |
	importer := JinCasinoVisitor defaultNew.
	importer useModel: importedModel.
	importer installPartialProject. 
	items do: [ :i | i acceptVisitor: importer ].
	errors := importer errors.
	importedProject := importer importedProject
]

{ #category : #importing }
JinCasinoAccessModelPartialImporter >> import: someItems into: aModel [
	items := someItems. 
	importedModel := aModel.
	self preImport.
	self import.
	self postImport
]

{ #category : #importing }
JinCasinoAccessModelPartialImporter >> importedProject [
	^ importedProject
]

{ #category : #accessing }
JinCasinoAccessModelPartialImporter >> items: someItems [

	items := someItems
]

{ #category : #importing }
JinCasinoAccessModelPartialImporter >> postImport [
	" Nothing todo  here yet "
]

{ #category : #importing }
JinCasinoAccessModelPartialImporter >> preImport [
	" Nothing yet "
]
