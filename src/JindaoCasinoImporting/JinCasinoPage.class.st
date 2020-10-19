Class {
	#name : #JinCasinoPage,
	#superclass : #CSNPage,
	#instVars : [
		'project',
		'kindOfPage'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
JinCasinoPage >> addWidget: aWidget [
	self mainContainer addWidget: aWidget
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> attributeNamed: aString put: aMDDataRead [ 
	self attributeAt: aString put: aMDDataRead 
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> bindings [

	^ self attributeAt: #bindings ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #accessing }
JinCasinoPage >> gtActionsIn: composite [
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> gtAttributesIn: composite [
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> gtSourceCodeIn: composite [
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> kindOfPage: aString [
	kindOfPage := aString asSymbol
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> mainContainer [
	^ self widgets first
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> mainContainer: aContainer [
	self assert: self widgets isEmpty.
	super addWidget: aContainer
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> mainContainerWidgets [
	^ self mainContainer layout cell collect: [ :f | f widget ]
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> project [
	^ project
]

{ #category : #accessing }
JinCasinoPage >> project: aJinCasinoProject [ 
	project := aJinCasinoProject.
	mooseModel := aJinCasinoProject model .
	aJinCasinoProject mooseModel add: self. 
]

{ #category : #'as yet unclassified' }
JinCasinoPage >> section: anInteger [
	| container |
	^ self mainContainerWidgets
		detect: [ :c | 
			c isContainer
				and: [ (c propertyNamed: 'SectionID') = anInteger asString ] ]
		ifNone: [ container := CSNUIPanel new.
			container propertyNamed: 'SectionID' put: anInteger asString.
			self mainContainer addWidget: container.
			mooseModel add: container.
			container ]
]
