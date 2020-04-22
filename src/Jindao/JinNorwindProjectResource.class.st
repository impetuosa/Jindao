Class {
	#name : #JinNorwindProjectResource,
	#superclass : #TestResource,
	#instVars : [
		'project'
	],
	#category : #'Jindao-Tests'
}

{ #category : #running }
JinNorwindProjectResource >> norwind [
	^ 'C:\Users\santiago\Documents\Northwind.accdb' asFileReference
]

{ #category : #running }
JinNorwindProjectResource >> project [
	^ project
]

{ #category : #running }
JinNorwindProjectResource >> setUp [
	super setUp.  
	project := (JinAccessApplication default open: self norwind)
]

{ #category : #running }
JinNorwindProjectResource >> tearDown [
	project close.
	
	super tearDown.
	
]
