Class {
	#name : #TestJinDAMImport,
	#superclass : #TestCase,
	#instVars : [
		'importer',
		'symbolTable',
		'model',
		'path'
	],
	#classInstVars : [
		'symbolTable'
	],
	#category : #'JinDAM-Tests'
}

{ #category : #accessing }
TestJinDAMImport class >> symbolTable [

	^ symbolTable ifNil: [ 
		  symbolTable := JinNSSymbolTable loadFrom: 'egrc.10.ston' ]
]

{ #category : #initialization }
TestJinDAMImport >> import [

	model := importer
		         import: self path asFileReference
		         symbolTable: symbolTable
]

{ #category : #initialization }
TestJinDAMImport >> link [

	importer link: model
]

{ #category : #initialization }
TestJinDAMImport >> path [ 

	^ path ifNil: [ path := 'c:\WMagnus\magact.accdb' asFileReference ].

]

{ #category : #initialization }
TestJinDAMImport >> runCaseManaged [
	^ self runCase
]

{ #category : #initialization }
TestJinDAMImport >> setUp [

	super setUp.
	importer := JinDAMImporter new.
	importer provider
		importCodeElements;
		importAllSyntacticElements.
	symbolTable := self class symbolTable
]
