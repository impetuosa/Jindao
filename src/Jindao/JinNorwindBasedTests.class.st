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
	^ 'C:\Users\santiago\Documents\Northwind.accdb' asFileReference
]

{ #category : #running }
JinNorwindBasedTests >> norwind [
	^ 'C:\Users\santiago\Documents\Northwind.accdb' asFileReference
]

{ #category : #running }
JinNorwindBasedTests >> project: aProject [ 
	project := aProject 
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
