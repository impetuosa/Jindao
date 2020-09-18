Class {
	#name : #JinCasinoPartialModelCreator,
	#superclass : #CSNMooseModelCreator,
	#instVars : [
		'importedProject',
		'errors',
		'items'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
JinCasinoPartialModelCreator class >> createModelOnSpecific: migratingItems named: aString [

	| importer |
	importer := self new.
	importer
		model: (CSNUICWModel new
				 name: 'Showroom';
				 yourself);
		items: migratingItems.
	importer basicRun
]

{ #category : #run }
JinCasinoPartialModelCreator >> basicRun [
	| importer |
	importer := JinCasinoAccessModelPartialImporter new
		import: items; 
		into: model.
	importedProject := importer importedProject .
	errors := importer errors. 
]

{ #category : #run }
JinCasinoPartialModelCreator >> items: aCollection [

	items := aCollection
]
