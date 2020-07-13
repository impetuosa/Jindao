Class {
	#name : #JinCasinoControlUnitTest,
	#superclass : #JinCasinoNorwindAbstractImportTestCase,
	#instVars : [
		'propertyMapping',
		'controlClass',
		'expectedImportedControlClass'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'building suites' }
JinCasinoControlUnitTest class >> testParameters [
	^ super testParameters
		forSelector: #testingBundle
		addOptions:
			{
			"{JinAttachment . CSNUIInputFile . { } }.
			{JinCheckbox . CSNUIInputCheckbox . { } }.
			{JinCombobox . CSNUISelect . { } }.
			{JinCommandButton . CSNUIButton . { } }.
			{JinImage . CSNUIImage . { } }.
			{JinLabel . CSNUIParagraph. { } }.
			{JinListBox . CSNUIOrderedList . { } }.
			{JinPage . CSNUITab . { } }.
			{JinRectangle . CSNUIPanel . { } }.
			{JinSubForm . CSNUIFieldset  . { } }.
			{JinTabControl . CSNUITabManager . { } }."
			{JinTextbox . CSNUIInputText . { } }
			}
]

{ #category : #tests }
JinCasinoControlUnitTest >> testPropertiesAreMappedProperly [
	self importAnyControlOfClass: controlClass.
	self halt.
]

{ #category : #tests }
JinCasinoControlUnitTest >> testPropertiesAreMappedProperlytestingBundle: aTriple [
	controlClass := aTriple first.
	expectedImportedControlClass := aTriple second.
	propertyMapping := aTriple third
]

{ #category : #tests }
JinCasinoControlUnitTest >> testingBundle: aTriple [
	controlClass := aTriple first.
	expectedImportedControlClass := aTriple second.
	propertyMapping := aTriple third
]
