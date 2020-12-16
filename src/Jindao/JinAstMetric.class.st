Class {
	#name : #JinAstMetric,
	#superclass : #JinMetrics,
	#category : #'Jindao-Metrics'
}

{ #category : #'instance creation' }
JinAstMetric >> newFunctionMetrics [
	^ self newEntryForType: #Function
]

{ #category : #'instance creation' }
JinAstMetric >> newPropertyAccessorMetrics [
	^ self newEntryForType: #PropertyAccessor
]

{ #category : #'instance creation' }
JinAstMetric >> newPropertyMetrics [
	^ self newEntryForType: #Property
]

{ #category : #'instance creation' }
JinAstMetric >> newSubMetrics [
	^ self newEntryForType: #SubProcedure
]
