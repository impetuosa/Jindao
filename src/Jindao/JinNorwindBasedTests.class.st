Class {
	#name : #JinNorwindBasedTests,
	#superclass : #TestCase,
	#instVars : [
		'project'
	],
	#category : #'Jindao-Tests'
}

{ #category : #running }
JinNorwindBasedTests >> norwind [
	^ 'C:\Users\santiago\Documents\Northwind.accdb' asFileReference
]

{ #category : #running }
JinNorwindBasedTests >> runCaseManaged [
	self runCase
]

{ #category : #running }
JinNorwindBasedTests >> setUp [
	project := JinAccessApplication default open: self norwind
]

{ #category : #running }
JinNorwindBasedTests >> tearDown [
	project close. 
	super tearDown
]
