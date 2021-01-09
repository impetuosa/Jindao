Class {
	#name : #JinStructuralMetric,
	#superclass : #JinMetrics,
	#category : #'Jindao-Metrics'
}

{ #category : #'as yet unclassified' }
JinStructuralMetric >> classModules [
	^ children at: #ClassModule
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> forms [
	^ children at: #Form
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> macros [
	^ children at: #Macro ifAbsent: [ {} ]
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> modules [
	^ children at: #Module
]

{ #category : #initialization }
JinStructuralMetric >> newClassModuleMetric [
	^ self newEntryForType: #ClassModule
]

{ #category : #initialization }
JinStructuralMetric >> newControlMetric [
	^ self newEntryForType: #Control
]

{ #category : #initialization }
JinStructuralMetric >> newFormMetric [
	^ self newEntryForType: #Form
]

{ #category : #initialization }
JinStructuralMetric >> newMacroMetric [
	^ self newEntryForType: #Macro
]

{ #category : #initialization }
JinStructuralMetric >> newModuleMetric [
	^ self newEntryForType: #Module
]

{ #category : #initialization }
JinStructuralMetric >> newQueryMetric [
	^ self newEntryForType: #Query
]

{ #category : #initialization }
JinStructuralMetric >> newReferenceMetric [
	^ self newEntryForType: #Reference
]

{ #category : #initialization }
JinStructuralMetric >> newReportMetric [
	^ self newEntryForType: #Report
]

{ #category : #initialization }
JinStructuralMetric >> newTableMetric [
	^ self newEntryForType: #Table
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> queries [
	^ children at: #Query
]

{ #category : #initialization }
JinStructuralMetric >> references [
	^ children at: #Refrence
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> reports [
	^ children at: #Report
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> tables [
	^ children at: #Table
]
