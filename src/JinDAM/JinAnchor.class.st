Class {
	#name : #JinAnchor,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinAnchor class >> entryName [

	^ #Anchor
]

{ #category : #'as yet unclassified' }
JinAnchor class >> on: aString [
	^ self new privateSetPath: (AbsolutePath from: aString)
]

{ #category : #arithmetic }
JinAnchor >> / aString [
	| new |
	new := self class new.
	
	new privateSetPath: path / aString adaptToAlceAnchorPathFragment  . 
	^ new 
]

{ #category : #arithmetic }
JinAnchor >> = anOtherAnchor [
	self species = anOtherAnchor species
		ifFalse: [ ^ false ].
	^ path = anOtherAnchor privateGetPath
]

{ #category : #arithmetic }
JinAnchor >> basename [
	^ path basename
]

{ #category : #'as yet unclassified' }
JinAnchor >> containsSource [

	^ path segments includes: '@src'
]

{ #category : #enumerating }
JinAnchor >> elementKind [

	self ensureWellformed.
	^ path at: 2
]

{ #category : #enumerating }
JinAnchor >> elementNSKind [

	self ensureWellformed.
	^ JinNSKind perform: self elementKind asSymbol
]

{ #category : #enumerating }
JinAnchor >> elementName [

	self ensureWellformed.
	^ path at: 3
]

{ #category : #enumerating }
JinAnchor >> elementProject [

	| pieces |
	pieces := '.' split: (path at: 1).
	^ pieces size > 1
		  ifTrue: [ pieces first ]
		  ifFalse: [ path at: 1 ]
]

{ #category : #enumerating }
JinAnchor >> elements [
]

{ #category : #enumerating }
JinAnchor >> elementsNameKindNamePairs [

	| limit |
	limit := path segments indexOf: '@src'.
	limit := limit = 0
		         ifTrue: [ path size ]
		         ifFalse: [ limit - 1 ].


	^ (2 to: limit by: 2) collect: [ :a | 
		{ 
			(path at: a + 1).
			(path at: a) asSymbol  } ].
		
]

{ #category : #enumerating }
JinAnchor >> elementsNameKindPairs [

	| limit |
	limit := path segments indexOf: '@src'.
	limit := limit = 0
		         ifTrue: [ path size ]
		         ifFalse: [ limit - 1 ].


	^ (2 to: limit by: 2) collect: [ :a | 
		{ 
			(path at: a + 1).
			JinNSKind perform: (path at: a) asSymbol  } ].
		
]

{ #category : #enumerating }
JinAnchor >> ensureWellformed [

	path size > 1 ifTrue: [ 
		self assert:
			({ 'modules'. 'forms'. 'reports'. 'table'. 'query'. 'references'. 'primitiveType'.  'enum'. 'function' . 'classAlias' .  'module' .'form'. 'report'. 'tables' .
			 'classModule'. 'globalVariable' } includes: (path at: 2)) ] 
]

{ #category : #arithmetic }
JinAnchor >> fullName [
	^ path fullName
]

{ #category : #enumerating }
JinAnchor >> hasTwoElements [
	^ path size = 9 
]

{ #category : #arithmetic }
JinAnchor >> hash [
	^ path hash
]

{ #category : #accessing }
JinAnchor >> path [
	^ path
]

{ #category : #arithmetic }
JinAnchor >> privateGetPath [
	^ path
]

{ #category : #arithmetic }
JinAnchor >> privateSetPath: aPath [
	path := aPath
]

{ #category : #'as yet unclassified' }
JinAnchor >> projectSelector [

	^ path at: 1
]

{ #category : #enumerating }
JinAnchor >> readEntityFrom: aProject andCollect: aFullBlockClosure [

	| val entity |
	path size = 3 ifFalse: [ ^ nil ].

	entity := (aProject perform: self elementKind asSymbol) detect: [ :m | 
		          m name = self elementName ].
	val := aFullBlockClosure value: entity.
	entity ensureUnload.
	^ val
]

{ #category : #resolving }
JinAnchor >> resolve: aProject [
	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
JinAnchor >> secondElementKind [

	^ path at: 4
]

{ #category : #'as yet unclassified' }
JinAnchor >> secondElementNSKind [

	^ JinNSKind perform: self secondElementKind asSymbol
]

{ #category : #'as yet unclassified' }
JinAnchor >> secondElementName [

	self ensureWellformed.
	^ path at: 5
]

{ #category : #'as yet unclassified' }
JinAnchor >> srcFrom [

	^ self containsSource
		  ifTrue: [ 
			  (path segments reverse at:
				   (path segments reverse indexOf: '@src') - 1) asNumber ]
		  ifFalse: [ -1 ]
]

{ #category : #'as yet unclassified' }
JinAnchor >> srcTo [

	^ (path segments reverse at: (path segments reverse  indexOf: #to) - 1) asNumber
]
