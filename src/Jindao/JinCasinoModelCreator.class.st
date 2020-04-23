Class {
	#name : #JinCasinoModelCreator,
	#superclass : #CSNMooseModelCreator,
	#instVars : [
		'importedProject'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #accessing }
JinCasinoModelCreator >> basicRun [
	| importer |
	importer := JinCasinoAccessModelImporter new
		import: blApplication
		into: model.
	importedProject := importer importedProject 
]
