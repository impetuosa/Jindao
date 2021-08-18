Class {
	#name : #JinDAMTableRelation,
	#superclass : #JinDAMEntity,
	#instVars : [
		'sourceTable',
		'foreignTable',
		'matches'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMTableRelation >> addMatch: aString to: aString2 [

	matches add: { 
			aString.
			aString2 }
]

{ #category : #accessing }
JinDAMTableRelation >> foreignTable: aString [ 
	foreignTable := aString
]

{ #category : #initialization }
JinDAMTableRelation >> initialize [

	super initialize.
	matches := OrderedCollection new
]

{ #category : #initialization }
JinDAMTableRelation >> printOn: aStream [

	aStream
		nextPutAll: 'Relatiion(';
		nextPutAll: sourceTable;
		nextPutAll: '=>';
		nextPutAll: foreignTable;
		nextPut: $)
]

{ #category : #accessing }
JinDAMTableRelation >> sourceTable: aString [ 
	sourceTable := aString
]
