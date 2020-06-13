Class {
	#name : #JinCasinoNorwindControlImportUnimplementedTestCase,
	#superclass : #JinCasinoNorwindAbstractImportTestCase,
	#instVars : [
		'controlClass'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'building suites' }
JinCasinoNorwindControlImportUnimplementedTestCase class >> testParameters [
	^ super testParameters
		forSelector: #controlClass
		addOptions: {JinLine}
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
