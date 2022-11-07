Class {
	#name : #JinAnchorSolver,
	#superclass : #Object,
	#instVars : [
		'projects',
		'anchors',
		'model'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinAnchorSolver class >> paths [

	^ { 
		  ('Northwind.accdb' -> 'c:\Northwind.accdb' asFileReference).
		  ('magact.accdb' -> 'C:\WMagnus\magact.accdb' asFileReference) }
		  asDictionary
]

{ #category : #solver }
JinAnchorSolver >> initialize [

	super initialize.
	projects := Dictionary new
]

{ #category : #accessing }
JinAnchorSolver >> model: anAlcixModel [ 
	model := anAlcixModel
]

{ #category : #'as yet unclassified' }
JinAnchorSolver >> projectFor: aString [

	| name |
	name := ('.' split: aString) first.

	^ projects at: name asLowercase ifAbsentPut: [ 
		  | reference n |
		  reference := model references detect: [ :r | 
			               r name asLowercase = name asLowercase ].
		  self
			  assert: reference isAccessModule
			  description: 'Trying to open a non access project'.

		  JinAccessApplication default open: reference path asFileReference ]
]

{ #category : #solver }
JinAnchorSolver >> readEntity: anAlceAnchor andCollect: aFullBlockClosure [

	| project |
	^ OSPlatform current isWindows ifTrue: [ 
		  project := self projectFor: anAlceAnchor projectSelector.
		  project ensureIsOpen.
		  anAlceAnchor readEntityFrom: project andCollect: aFullBlockClosure ]
]
