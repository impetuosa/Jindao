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
			{JinControlAttachment . CSNUIInputFile }.
			{JinControlCheckbox . CSNUIInputCheckbox }.
			{JinControlCombobox . CSNUISelect }.
			{JinControlCommandButton . CSNUIButton }.
			{JinControlImage . CSNUIImage }.
			{JinControlLabel . CSNUIParagraph}.
			{JinControlListBox . CSNUIOrderedList }.
			{JinControlPage . CSNUITab }.
			{JinControlRectangle . CSNUIPanel }.
			{JinControlSubForm . CSNUIFieldset  }.
			{JinControlTabControl . CSNUITabManager }.
			{JinControlTextbox . CSNUIInputText }
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
