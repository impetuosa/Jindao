Class {
	#name : #JinNorwindBasedTests,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'project'
	],
	#category : #'Jindao-Tests'
}

{ #category : #'building suites' }
JinNorwindBasedTests class >> norwind [
	^ 'c:\Northwind.accdb' asFileReference
]

{ #category : #running }
JinNorwindBasedTests >> runCaseManaged [
	self runCase
]

{ #category : #running }
JinNorwindBasedTests >> setUp [
	super setUp.
	project := JinAccessApplication default open: self class norwind 
]

{ #category : #running }
JinNorwindBasedTests >> tearDown [
	[ project close ]
		ensure: [ project quit ]
]
