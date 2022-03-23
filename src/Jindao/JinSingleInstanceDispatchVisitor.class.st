Class {
	#name : #JinSingleInstanceDispatchVisitor,
	#superclass : #JinMultiVisitor,
	#instVars : [
		'symbolTable',
		'state',
		'control',
		'gui',
		'database',
		'code',
		'syntax',
		'project',
		'reference',
		'referenceLibrary',
		'referenceAccess'
	],
	#category : #'Jindao-Subvisitor'
}

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> code [
	^ code
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> code: aVisitor [
	code := aVisitor.
	aVisitor ifNotNil: [ :v | v parent: self ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> control [
	^ control
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> control: aControl [
	control := aControl.
	aControl ifNotNil: [ :v | v parent: self ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> database [
	^ database
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> database: aDBVisitor [
	database := aDBVisitor.
	aDBVisitor ifNotNil: [ :v | v parent: self ]
]

{ #category : #'as yet unclassified' }
JinSingleInstanceDispatchVisitor >> firstClassCitizen [
	^ self
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> gui [
	^ gui
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> gui: aGuiVisitor [
	gui := aGuiVisitor.
	aGuiVisitor ifNotNil: [ :v | v parent: self ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> project [
	^ project
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> project: aProjectVisitor [
	project := aProjectVisitor.
	aProjectVisitor ifNotNil: [ :v | v parent: self ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> referenceAccess [
	^ referenceAccess
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> referenceAccess: aVisitor [
	referenceAccess := aVisitor.
	aVisitor ifNotNil: [ :v | v parent: self ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> referenceLibrary [
	^ referenceLibrary
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> referenceLibrary: aVisitor [
	referenceLibrary := aVisitor.
	aVisitor ifNotNil: [ :v | v parent: self ]
]

{ #category : #'as yet unclassified' }
JinSingleInstanceDispatchVisitor >> state [
	^ state
]

{ #category : #accessing }
JinSingleInstanceDispatchVisitor >> symbolTable [
	^ symbolTable 
]

{ #category : #accessing }
JinSingleInstanceDispatchVisitor >> symbolTable: aJinNSSymbolTable [ 
	symbolTable := aJinNSSymbolTable
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> syntax [
	^ syntax
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> syntax: aVisitor [
	syntax := aVisitor.
	aVisitor ifNotNil: [ :v | v parent: self ]
]
