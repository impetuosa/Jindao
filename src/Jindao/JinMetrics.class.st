Class {
	#name : #JinMetrics,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #'as yet unclassified' }
JinMetrics >> incrementCounterFor: aString [ 
	| val |
	val := entries at: aString ifAbsentPut:[0].
	entries at: aString put: val +1 .
	
]

{ #category : #initialization }
JinMetrics >> initialize [  
	super initialize. 
	entries := Dictionary new.
]

{ #category : #initialization }
JinMetrics >> newEntryForType: anObjectType [
	| metric |
	metric := self class new.
	(entries at: anObjectType ifAbsentPut: [ OrderedCollection new ])
		add: metric.
	^ metric
]

{ #category : #initialization }
JinMetrics >> register: aName value: aValue [
	entries at: aName put: aValue
]

{ #category : #initialization }
JinMetrics >> registerDependancy: aDependancy kind: aKindOfDependancy [
	(entries at: #Dependencies ifAbsentPut: [ Set new ])
		add: {aKindOfDependancy . aDependancy}
]

{ #category : #'as yet unclassified' }
JinMetrics >> registeredDependencies [
	^ entries at: #Dependencies ifAbsent: [ Array empty ]
]

{ #category : #'as yet unclassified' }
JinMetrics >> value: aString [
	^ entries at: aString
]
