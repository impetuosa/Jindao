Class {
	#name : #JinCasinoNorwindTestCase,
	#superclass : #JinNorwindBasedTests,
	#instVars : [
		'factory'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #tests }
JinCasinoNorwindTestCase >> setUp [
	super setUp.
	factory := JinCasinoModelStatelessFactory  new
]

{ #category : #tests }
JinCasinoNorwindTestCase >> testAfterJinFormIsImportedIsBoundedToTheProject [
	| importedObject importedForm |
	importedObject := factory importProject: project.
	importedForm := factory
		importForm: project forms first
		inTheContextOf: importedObject.
	self assert: importedForm project equals: importedObject.
	self assert: importedObject pages size equals: 1.
	self assert: importedObject pages anyOne equals: importedForm
]

{ #category : #tests }
JinCasinoNorwindTestCase >> testJinFormControlImportsTheNameAndNoneWidgets [
	| importedObject importedForm |
	importedObject := factory importProject: project.
	importedForm := factory importForm: project forms first inTheContextOf: importedObject. 
	self assert: importedForm name equals: importedForm name.
	self assert: importedForm widgets isEmpty.
	
]

{ #category : #tests }
JinCasinoNorwindTestCase >> testJinFormImportsIntoJinPage [
	| importedObject importedForm |
	importedObject := factory importProject: project.
	importedForm := factory importForm: project forms first inTheContextOf: importedObject. 
	self assert: importedForm class equals: JinPage 
	
]

{ #category : #tests }
JinCasinoNorwindTestCase >> testJinFormImportsTheNameAndNoneWidgets [
	| importedObject importedForm |
	importedObject := factory importProject: project.
	importedForm := factory importForm: project forms first inTheContextOf: importedObject. 
	self assert: importedForm name equals: importedForm name.
	self assert: importedForm widgets isEmpty.
	
]

{ #category : #tests }
JinCasinoNorwindTestCase >> testJinProjectImportsIntoJinCasinoProject [
	| importedObject |
	importedObject := factory importProject: project.
	self assert: importedObject class equals: JinCasinoProject
]

{ #category : #tests }
JinCasinoNorwindTestCase >> testJinProjectImportsTheNameAndNonWidgets [
	| importedObject |
	importedObject := factory importProject: project.
	self assert: importedObject name equals: project name.
	self assert: importedObject pages isEmpty
	
]
