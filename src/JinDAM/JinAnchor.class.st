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
	| new fragment |
	new := self class new.
	fragment := self scapeSlash: (aString adaptToAlceAnchorPathFragment) .
	new privateSetPath: path / fragment. 
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
	^ self fragmentAt: 2
]

{ #category : #enumerating }
JinAnchor >> elementNSKind [

	self ensureWellformed.
	^ JinNSKind perform: self elementKind asSymbol
]

{ #category : #enumerating }
JinAnchor >> elementName [

	self ensureWellformed.
	^ self fragmentAt: 3
]

{ #category : #enumerating }
JinAnchor >> elementProject [

	| pieces |
	pieces := '.' split: (self fragmentAt: 1).
	^ pieces size > 1
		  ifTrue: [ pieces first ]
		  ifFalse: [ self fragmentAt: 1 ]
]

{ #category : #enumerating }
JinAnchor >> elementsNameKindNamePairs [

	| limit |
	limit := path segments indexOf: '@src'.
	limit := limit = 0
		         ifTrue: [ self size ]
		         ifFalse: [ limit - 1 ].


	^ (2 to: limit by: 2) collect: [ :a | 
		  { 
			  (self fragmentAt: a + 1).
			  (self fragmentAt: a) asSymbol } ]
]

{ #category : #enumerating }
JinAnchor >> elementsNameKindPairs [

	| limit |
	limit := path segments indexOf: '@src'.
	limit := limit = 0
		         ifTrue: [ self size ]
		         ifFalse: [ limit - 1 ].


	^ (2 to: limit by: 2) collect: [ :a | 
		  { 
			  (self fragmentAt: a + 1).
			  (JinNSKind perform: (self fragmentAt: a) asSymbol) } ]
]

{ #category : #enumerating }
JinAnchor >> ensureWellformed [

	self size > 1 ifTrue: [ 
		self assert:
			({ 'modules'. 'forms'. 'reports'. 'table'. 'query'. 'references'.
			 'primitiveType'. 'enum'. 'function'. 'classAlias'. 'module'.
			 'form'. 'report'. 'tables'. 'classModule'. 'globalVariable' } 
				 includes: (self fragmentAt: 2)) ]
]

{ #category : #enumerating }
JinAnchor >> fragmentAt: aNumber [

	^ self unscapeSlash: (path at: aNumber)
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

{ #category : #generated }
JinAnchor >> names [

	self containsSource ifTrue: [ 
		^ (1 to: (path segments indexOf: '@src') by: 2) collect: [ :i | 
			  path at: i ] ].
	^ (1 to: path segments size by: 2) collect: [ :i | path at: i ]
]

{ #category : #accessing }
JinAnchor >> path [
	^ path
]

{ #category : #'as yet unclassified' }
JinAnchor >> pathIsNotSet [

	^ false
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

	^ self fragmentAt: 1
]

{ #category : #enumerating }
JinAnchor >> readEntityFrom: aProject andCollect: aFullBlockClosure [

	| val entity |
	self size >= 3 ifFalse: [ ^ nil ].

	entity := (aProject perform: self elementKind asSymbol) detect: [ :m | 
		          m name = self elementName ].
	val := aFullBlockClosure value: entity.
	entity ensureUnload.
	^ val
]

{ #category : #arithmetic }
JinAnchor >> scapeSlash: fragment [

	^ fragment copyReplaceAll: '/' with: '^'
]

{ #category : #'as yet unclassified' }
JinAnchor >> secondElementKind [

	^ self fragmentAt: 4
]

{ #category : #'as yet unclassified' }
JinAnchor >> secondElementNSKind [

	^ JinNSKind perform: self secondElementKind asSymbol
]

{ #category : #'as yet unclassified' }
JinAnchor >> secondElementName [

	self ensureWellformed.
	^ self fragmentAt: 5
]

{ #category : #enumerating }
JinAnchor >> size [ 
	 ^ path size 
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

	^ (path segments reverse at: (path segments reverse indexOf: #to) - 1)
		  asNumber
]

{ #category : #arithmetic }
JinAnchor >> unscapeSlash: fragment [

	^ fragment copyReplaceAll: '^' with: '/'
]
