Class {
	#name : #JinMetrics,
	#superclass : #Object,
	#instVars : [
		'children',
		'properties',
		'dependancies'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #'as yet unclassified' }
JinMetrics >> incrementCounterFor: aString [
	| val |
	val := properties at: aString ifAbsentPut: [ 0 ].
	properties at: aString put: val + 1
]

{ #category : #initialization }
JinMetrics >> initialize [
	super initialize.
	children := Dictionary new.
	properties := Dictionary new.
	dependancies := Set new
]

{ #category : #initialization }
JinMetrics >> newEntryForType: anObjectType [
	| metric type |
	type := self class environment
		at: ('Jin{1}Metric' format: {anObjectType}) asSymbol.
	metric := type new.
	metric register: #AccesType value: anObjectType.
	(children at: anObjectType ifAbsentPut: [ OrderedCollection new ])
		add: metric.
	^ metric
]

{ #category : #initialization }
JinMetrics >> register: aName value: aValue [
	properties at: aName put: aValue
]

{ #category : #initialization }
JinMetrics >> registerDependancy: aDependancy kind: aKindOfDependancy [
	dependancies
		add:
			{aKindOfDependancy.
			aDependancy}
]

{ #category : #'as yet unclassified' }
JinMetrics >> registeredDependencies [
	^ dependancies
]

{ #category : #'as yet unclassified' }
JinMetrics >> value: aString [
	^ properties at: aString
]
