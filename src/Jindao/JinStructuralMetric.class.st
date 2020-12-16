Class {
	#name : #JinStructuralMetric,
	#superclass : #JinMetrics,
	#category : #'Jindao-Metrics'
}

{ #category : #'as yet unclassified' }
JinStructuralMetric >> classModules [
	^ entries at: #ClassModule
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> forms [
	^ entries at: #Form
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> macros [
	^ entries at: #Macro ifAbsent: [ {} ]
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> modules [
	^ entries at: #Module
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
	^ self newEntryForType: #Refrence
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
	^ entries at: #Query
]

{ #category : #initialization }
JinStructuralMetric >> references [
	^ entries at: #Refrence
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> reports [
	^ entries at: #Report
]

{ #category : #'as yet unclassified' }
JinStructuralMetric >> tables [
	^ entries at: #Table
]
