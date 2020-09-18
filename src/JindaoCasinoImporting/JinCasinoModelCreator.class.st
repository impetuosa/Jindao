Class {
	#name : #JinCasinoModelCreator,
	#superclass : #CSNMooseModelCreator,
	#instVars : [
		'importedProject',
		'errors'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
JinCasinoModelCreator class >> createModelOnSpecific: migratingItems named: aString [

	| importer |
	importer := self new.
	importer
		model: (CSNUICWModel new
				 name: 'Showroom';
				 yourself);
		items: migratingItems.
	importer basicRun
]

{ #category : #'as yet unclassified' }
JinCasinoModelCreator class >> norwindExample [
	| project importer |
	project := JinAccessApplication default
		open:
			'D:\Users\Santiago.BRAGAGNOLO\Documents\norwind\Northwind.accdb'
				asFileReference.
	importer := JinCasinoModelCreator new.
	importer
		model:
			(CSNUICWModel new
				name: 'Showroom';
				yourself);
		blApplication: project.
	importer basicRun.
	JinCSNModelExporterAngularBLSpecific export: importer model
]

{ #category : #accessing }
JinCasinoModelCreator >> basicRun [
	| importer |
	importer := JinCasinoAccessModelImporter new
		import: blApplication
		into: model.
	importedProject := importer importedProject .
	errors := importer errors. 
]
