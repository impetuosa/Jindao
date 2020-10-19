Class {
	#name : #JinCasinoProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'pages',
		'model',
		'mapping'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #accessing }
JinCasinoProject >> initialize [
	super initialize.
	pages := Set new.
	mapping := OrderedCollection new.
]

{ #category : #accessing }
JinCasinoProject >> map: aJinDaoElement to: aCasinoElement [
	(aJinDaoElement isNotNil and: [ aCasinoElement isNotNil ])
		ifTrue: [ mapping
				add:
					{aJinDaoElement.
					aCasinoElement} ]
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> mappedModelFor: aJinTabControl [
	^ (mapping detect: [ :a | a first = aJinTabControl ]) second
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> mappedModelFor: aJinTabControl ifNone: aBlockClosure [
	^ mapping
		detect: [ :a | a first = aJinTabControl ]
		ifFound: [ :v | v second ]
		ifNone: [ aBlockClosure value ]
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> model [
	^ model
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> model: aModel [ 
	^ model := aModel 
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> mooseModel [
	^ model
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> mooseModelMappedTo: aJinForm [ 
	^ (mapping detect: [ : m | m includes: aJinForm  ]) second 
]

{ #category : #'as yet unclassified' }
JinCasinoProject >> name [
	^ name
]

{ #category : #accessing }
JinCasinoProject >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinCasinoProject >> pages [
	^ pages 
]
