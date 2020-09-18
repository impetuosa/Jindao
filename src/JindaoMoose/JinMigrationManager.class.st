Class {
	#name : #JinMigrationManager,
	#superclass : #Object,
	#instVars : [
		'itemsToMigrate',
		'destination',
		'casinoModel',
		'angularModel'
	],
	#category : #JindaoMoose
}

{ #category : #'as yet unclassified' }
JinMigrationManager >> calculateComponents [
	casinoModel := JinCasinoModelCreator createModelOnSpecific: itemsToMigrate  named:'MigrationProcess'.
	angularModel := JinCasinoToAngularModel loadFrom: casinoModel.
	
	
]

{ #category : #accessing }
JinMigrationManager >> destination: aJinAngularModule [ 
	destination := aJinAngularModule
]

{ #category : #'as yet unclassified' }
JinMigrationManager >> registerElements: aCollection [ 
	itemsToMigrate := aCollection  
]
