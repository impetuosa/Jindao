Class {
	#name : #JinCasinoNorwindEntryElementsImportTestCase,
	#superclass : #JinCasinoNorwindAbstractImportTestCase,
	#category : #'Jindao-CasinoImporting'
}

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> setUp [
	super setUp.
	factory := JinCasinoModelStatelessFactory  new
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testAfterJinFormIsImportedIsBoundedToTheProject [
	self importAnyForm.
	self assert: importedForm project equals: importedProject.
	self assert: importedProject pages size equals: 1.
	self assert: importedProject pages anyOne equals: importedForm
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testImportedFormGeneratesOnlyOneBusinessPage [
	self importAnyForm.
	self assert: importedForm businessPage size equals: 1.
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testImportedGeneratedBusinessPageHasTheSameNameAsTheForm [
	self importAnyForm.
	self assert: importedForm businessPage first name equals: form name.
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testJinFormImportsIntoJinPage [
	self importAnyForm.
	self assert: importedForm class equals: JinPage 
	
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testJinFormImportsTheNameAndNoneWidgets [
	self importAnyForm.
	self assert: importedForm name equals: form name.
	self assert: importedForm realClassName equals: #JinForm.
	self assert: importedForm widgets isEmpty
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testJinProjectImportsIntoJinCasinoProject [
	self importProject.
	self assert: importedProject class equals: JinCasinoProject
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testJinProjectImportsTheNameAndNonWidgets [
	self importProject.
	self assert: importedProject name equals: project name.
	self assert: importedProject pages isEmpty
]
