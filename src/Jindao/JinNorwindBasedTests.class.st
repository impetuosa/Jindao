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
	^ 'D:\Users\Santiago.BRAGAGNOLO\Documents\norwind\Northwind.accdb'
		asFileReference
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
