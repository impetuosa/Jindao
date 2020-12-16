Class {
	#name : #JinMetrics,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #'as yet unclassified' }
JinMetrics >> classModules [
	^ entries at: #ClassModule
]

{ #category : #'as yet unclassified' }
JinMetrics >> forms [
	^ entries at: #Form
]

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

{ #category : #'as yet unclassified' }
JinMetrics >> macros [
	^ entries at: #Macro ifAbsent: [ {} ]
]

{ #category : #'as yet unclassified' }
JinMetrics >> modules [
	^ entries at: #Module
]

{ #category : #initialization }
JinMetrics >> newClassModuleMetric [
	^ self newEntryForType: #ClassModule
]

{ #category : #initialization }
JinMetrics >> newControlMetric [
	^ self newEntryForType: #Control
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
JinMetrics >> newFormMetric [
	^ self newEntryForType: #Form
]

{ #category : #initialization }
JinMetrics >> newMacroMetric [
	^ self newEntryForType: #Macro
]

{ #category : #initialization }
JinMetrics >> newModuleMetric [
	^ self newEntryForType: #Module
]

{ #category : #initialization }
JinMetrics >> newQueryMetric [
	^ self newEntryForType: #Query
]

{ #category : #initialization }
JinMetrics >> newReferenceMetric [
	^ self newEntryForType: #Refrence
]

{ #category : #initialization }
JinMetrics >> newReportMetric [
	^ self newEntryForType: #Report
]

{ #category : #initialization }
JinMetrics >> newTableMetric [
	^ self newEntryForType: #Table
]

{ #category : #'as yet unclassified' }
JinMetrics >> queries [
	^ entries at: #Query
]

{ #category : #initialization }
JinMetrics >> references [
	^ entries at: #Refrence
]

{ #category : #initialization }
JinMetrics >> register: aName value: aValue [
	entries at: aName put: aValue
]

{ #category : #initialization }
JinMetrics >> registerDependancy: aDependancy kind: aKindOfDependancy [
	(entries at: #Dependencies ifAbsentPut: [ OrderedCollection new ])
		add: {aKindOfDependancy . aDependancy}
]

{ #category : #'as yet unclassified' }
JinMetrics >> registeredDependencies [
	^ entries at: #Dependencies ifAbsent: [ Array empty ]
]

{ #category : #'as yet unclassified' }
JinMetrics >> reports [
	^ entries at: #Report
]

{ #category : #'as yet unclassified' }
JinMetrics >> tables [
	^ entries at: #Table
]

{ #category : #'as yet unclassified' }
JinMetrics >> value: aString [
	^ entries at: aString
]
