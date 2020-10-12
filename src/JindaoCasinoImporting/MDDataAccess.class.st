Class {
	#name : #MDDataAccess,
	#superclass : #MDDataEntity,
	#instVars : [
		'entity'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #accessing }
MDDataAccess >> entity [
	^ entity
]

{ #category : #accessing }
MDDataAccess >> entity: anEntity [
	entity := anEntity
]

{ #category : #'as yet unclassified' }
MDDataAccess >> readsColumn: aString [

	^ (entity elements detect: [ :e | e name = aString ]) read
]
