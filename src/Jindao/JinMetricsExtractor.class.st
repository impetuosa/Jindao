Class {
	#name : #JinMetricsExtractor,
	#superclass : #JinStackVisitor,
	#instVars : [
		'metrics'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> initialize [ 
	super initialize. 
	stack push: JinMetrics new.
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> metrics [
	^ stack top
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> metricsFor: aProject [
	aProject acceptVisitor: self.
	self
		assert: stack size = 1
		description: 'The stack is inconsistent. It is suppose to finish with one element'.
	^ self metrics
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitAccessProperty: aProperty [
	self metrics incrementCounterFor: #Properties
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitForm: aForm [
	self push: self metrics newFormMetric during: [ 
		self metrics register: #name value: aForm name. 
		self metrics register: #type value: aForm formType. 
		self metrics register: #properties value: aForm properties size. 
		super visitForm: aForm 
	].
	aForm ensureUnload.
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitFormControl: aControl [
	self metrics incrementCounterFor: #Controls
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitIndex: aJinIndex [
	"Should we include this?"
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitMacro: anObject [
	self metrics newMacroMetric
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitModule: anObject [
	| mtrx |
	mtrx := anObject isClassModule
		ifTrue: [ self metrics newClassModuleMetric ]
		ifFalse: [ self metrics newModuleMetric ].
	self push: mtrx during: [ super visitModule: anObject ].
	anObject ensureUnload
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitProject: aJinAccessProject [
	super visitProject: aJinAccessProject.
	self visitCollection: aJinAccessProject macros
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitQuery: anObject [
	self
		push: self metrics newQueryMetric
		during: [ super visitQuery: anObject ].
	anObject ensureUnload
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitReference: aRef [
	| metric |
	metric := self metrics newReferenceMetric.
	metric register: #BuiltIn value: aRef isBuiltIn.
	metric register: #Path value: aRef path.
	metric register: #Major value: aRef major.
	metric register: #Minor value: aRef minor
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitReport: aReport [
	self
		push: self metrics newReportMetric
		during: [ super visitReport: aReport ].
	aReport ensureUnload
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitSubForm: aSubform [
	self metrics registerDependancy: aSubform name.
	super visitSubForm: aSubform
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitTable: anObject [
	self
		push: self metrics newTableMetric
		during: [ super visitTable: anObject ].
	anObject ensureUnload
]

{ #category : #'visit-first-objects' }
JinMetricsExtractor >> visitTableRelation: aJinTableRelation [
	"Should we include this?"
]
