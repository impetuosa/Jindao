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
	project := JinNorwindProjectResource current project
]

{ #category : #running }
JinNorwindBasedTests >> tearDown [
	[ project forms do: #close.
	project reports do: #close.
	project tables do: #close ]
		on: Win32Error
		do: [ :e | e passIfNotError0x80020009 ]
]
