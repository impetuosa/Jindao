Class {
	#name : #JinCasinoNorwindControlImportTestCase,
	#superclass : #JinCasinoNorwindAbstractImportTestCase,
	#instVars : [
		'controlClass',
		'expectedImportedControlClass'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'building suites' }
JinCasinoNorwindControlImportTestCase class >> testParameters [
	^ super testParameters
		forSelector: #testingBundle
		addOptions:
			{
			{JinAttachment . CSNUIInputFile }.
			{JinCheckbox . CSNUIInputCheckbox }.
			{JinCombobox . CSNUISelect }.
			{JinCommandButton . CSNUIButton }.
			{JinImage . CSNUIImage }.
			{JinLabel . CSNUIParagraph}.
			{JinListBox . CSNUIOrderedList }.
			{JinPage . CSNUITab }.
			{JinRectangle . CSNUIPanel }.
			{JinSubForm . CSNUIFieldset  }.
			{JinTabControl . CSNUITabManager }.
			{JinTextbox . CSNUIInputText }
			}
]

{ #category : #tests }
JinCasinoNorwindControlImportTestCase >> testControlMapsToExpectedCSNObject [
	self importAnyControlOfClass: controlClass.
	self
		assert: importedControl class
		equals: expectedImportedControlClass
]

{ #category : #tests }
JinCasinoNorwindControlImportTestCase >> testImportedControlParentPointsToImportedForm [
	self importAnyControlOfClass: controlClass.
	self
		assert: importedControl widgetContainer
		equals: importedForm businessPage first
]

{ #category : #tests }
JinCasinoNorwindControlImportTestCase >> testingBundle: aDuple [
	controlClass := aDuple first.
	expectedImportedControlClass := aDuple second
]
