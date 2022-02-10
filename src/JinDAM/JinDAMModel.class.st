Class {
	#name : #JinDAMModel,
	#superclass : #Object,
	#instVars : [
		'entities'
	],
	#classInstVars : [
		'northwind'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMModel class >> northwind [
	^ northwind
]

{ #category : #'as yet unclassified' }
JinDAMModel class >> northwind: aJinDAMModel [

	northwind := aJinDAMModel
]

{ #category : #visiting }
JinDAMModel >> accept: anAlceJinDAMLoader [

	^ anAlceJinDAMLoader visitModel: self
]

{ #category : #'as yet unclassified' }
JinDAMModel >> allButReferences [

	^ entities reject: [ :e | e isKindOf: JinDAMReference ]
]

{ #category : #accessing }
JinDAMModel >> entities [
	^ entities
]

{ #category : #'instance creation' }
JinDAMModel >> initialize [

	super initialize.
	entities := OrderedCollection new . 
]

{ #category : #'instance creation' }
JinDAMModel >> instantiate: aClass [

	| obj |
	obj := aClass new.
	entities add: obj.
	^ obj
]

{ #category : #testing }
JinDAMModel >> isTypeReference [
	^ false
]

{ #category : #accessing }
JinDAMModel >> references [
	^ entities select: [ :e | e isKindOf: JinDAMReference  ]
]
