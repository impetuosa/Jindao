Class {
	#name : #JinCasinoNorwindControlImportUnimplementedTestCase,
	#superclass : #JinCasinoNorwindAbstractImportTestCase,
	#instVars : [
		'controlClass'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'building suites' }
JinCasinoNorwindControlImportUnimplementedTestCase class >> testParameters [
	^ super testParameters
		forSelector: #controlClass
		addOptions: {JinControlLine}
]

{ #category : #accessing }
JinCasinoNorwindControlImportUnimplementedTestCase >> controlClass: aControlClass [
	controlClass := aControlClass
]

{ #category : #accessing }
JinCasinoNorwindControlImportUnimplementedTestCase >> testImportRaiseError [
	self
		should: [ self importAnyControlOfClass: controlClass ]
		raise: Error
]
