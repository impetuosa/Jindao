Class {
	#name : #JinCasinoNorwindAbstractImportTestCase,
	#superclass : #JinNorwindBasedTests,
	#instVars : [
		'factory',
		'importedProject',
		'form',
		'importedForm',
		'control',
		'importedControl'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #running }
JinCasinoNorwindAbstractImportTestCase >> importAnyControlOfClass: aClass [
	aClass ifNil: [ ^ self error:' Trying to find nil as control class' ].
	project forms do: [ : f | 
		f controls detect: [ : c| c class = aClass ]	ifFound:[ : c | ^ c ].
	 ].
	self error:'Unable to find in the current project a control of class ' , aClass .
]

{ #category : #running }
JinCasinoNorwindAbstractImportTestCase >> importAnyForm [
	^ self importForm: project forms first 
]

{ #category : #running }
JinCasinoNorwindAbstractImportTestCase >> importAnyFormNamed: aName [
	^ self importForm: (project forms detect: [ :f | f name = aName ])
]

{ #category : #running }
JinCasinoNorwindAbstractImportTestCase >> importControl: aControl [ 
	self importForm: aControl parent.
	control := aControl.
	^ importedControl := factory
		importControl: control
		inTheContextOf: importedProject
]

{ #category : #running }
JinCasinoNorwindAbstractImportTestCase >> importForm: aForm [
	self importProject.
	form := aForm.
	^ importedForm := factory
		importForm: aForm
		inTheContextOf: importedProject
]

{ #category : #running }
JinCasinoNorwindAbstractImportTestCase >> importProject [
	^ importedProject := factory importProject: project
]

{ #category : #running }
JinCasinoNorwindAbstractImportTestCase >> setUp [
	super setUp.
	factory := JinCasinoModelStatelessFactory  new
]