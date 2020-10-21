Class {
	#name : #MDDataAccess,
	#superclass : #MDDataEntity,
	#instVars : [
		'entity',
		'allowEdits',
		'allowDeletions',
		'allowAdditions',
		'allowFilters'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
MDDataAccess >> allowAdditions [
	^ allowAdditions
]

{ #category : #'as yet unclassified' }
MDDataAccess >> allowAdditions: aBoolean [
	allowAdditions := aBoolean
]

{ #category : #'as yet unclassified' }
MDDataAccess >> allowDeletions [
	^ allowDeletions
]

{ #category : #'as yet unclassified' }
MDDataAccess >> allowDeletions: aBoolean [
	allowDeletions := aBoolean
]

{ #category : #'as yet unclassified' }
MDDataAccess >> allowEdits [
	^ allowEdits
]

{ #category : #'as yet unclassified' }
MDDataAccess >> allowEdits: aBoolean [
	allowEdits := aBoolean
]

{ #category : #'as yet unclassified' }
MDDataAccess >> allowFilters [
	^ allowFilters
]

{ #category : #'as yet unclassified' }
MDDataAccess >> allowFilters: aBoolean [
	allowFilters := aBoolean
]

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
	| bindingName |
	bindingName := (aString beginsWith: '=')
		ifTrue: [ aString
				copyFrom: (aString indexOf: $[) + 1
				to: (aString indexOf: $]) - 1 ]
		ifFalse: [ aString ].
	^ entity elements
		detect: [ :e | e name = bindingName ]
		ifFound: [ :e | e read ]
		ifNone: [ nil ]
]
