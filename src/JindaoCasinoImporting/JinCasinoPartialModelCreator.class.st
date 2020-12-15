Class {
	#name : #JinCasinoPartialModelCreator,
	#superclass : #JinAccidentalMooseModelCreator,
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
	importer basicRun.
	^ importer
]

{ #category : #run }
JinCasinoPartialModelCreator >> basicRun [

	| importer |
	importer := JinCasinoAccessModelPartialImporter new
		            import: items
		            into: model.
	importedProject := importer importedProject.
	errors := importer errors
]

{ #category : #accessing }
JinCasinoPartialModelCreator >> firstClassCitizenMooseModels [
	^ items collect: [ :i |  importedProject  mooseModelMappedTo: i  ]
]

{ #category : #accessing }
JinCasinoPartialModelCreator >> importedProject [
	^ importedProject
]

{ #category : #accessing }
JinCasinoPartialModelCreator >> items [
	^ items
]

{ #category : #run }
JinCasinoPartialModelCreator >> items: aCollection [

	items := aCollection
]
