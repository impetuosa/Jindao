Class {
	#name : #JinStructuralMetricsExtractor,
	#superclass : #JinStackVisitor,
	#category : #'Jindao-Metrics'
}

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> initialize [ 
	super initialize. 
	stack push: JinStructuralMetric new.
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> loadMetricsFromFormOrReport: aForm [
	| dataSource |
	self metrics register: #name value: aForm name.
	self metrics register: #type value: aForm formType.
	self metrics register: #properties value: aForm properties size.
	self metrics register: #hasModule value: aForm hasModule.
	dataSource := aForm recordSourceFull.
	dataSource isString
		ifTrue: [ self metrics registerDependancy: dataSource kind: #EmbddedQuery ]
		ifFalse: [ dataSource
				ifNotNil: [ self metrics
						registerDependancy: dataSource name
						kind: (dataSource class name copyReplaceAll: 'Jin' with: '') ] ]
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> metrics [
	^ stack top
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> metricsFor: aProject [
	aProject acceptVisitor: self.
	self
		assert: stack size = 1
		description: 'The stack is inconsistent. It is suppose to finish with one element'.
	^ self metrics
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> sourceCodeMetrixExtractor [
	^ JinASTMetricsExtractor new
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitAccessProperty: aProperty [
	self metrics incrementCounterFor: #Properties
]

{ #category : #'as yet unclassified' }
JinStructuralMetricsExtractor >> visitCustomControl: aControl [
	" 
	Some controls arrive here by accident...
	JinControl delegate bydefault to visitCustomControl:. Probably is a bad decision . Should change it 
	"
	 "Can we get the class of this custom control? "

	aControl isCustomControl
		ifTrue: [ [ self metrics
				registerDependancy: aControl name
				kind: 'CustomControl' ]
				on: Error
				do: [ self metrics
						registerDependancy: 'ErrorGettingName'
						kind: 'CustomControl' ] ]
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitForm: aForm [
	self
		push: self metrics newFormMetric
		during: [ 
			self loadMetricsFromFormOrReport: aForm.
			super visitForm: aForm 
		].
	aForm ensureUnload
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitFormControl: aControl [
	self metrics incrementCounterFor: #Controls
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitIndex: aJinIndex [
	"Should we include this?"
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitMacro: anObject [
	self metrics newMacroMetric
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitModule: anObject [
	| mtrx |
	mtrx := anObject isClassModule
		ifTrue: [ self metrics newClassModuleMetric ]
		ifFalse: [ self metrics newModuleMetric ].
	self push: mtrx during: [ 

		super visitModule: anObject 
		].
	anObject ensureUnload
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitProject: aJinAccessProject [
	super visitProject: aJinAccessProject.
	self visitCollection: aJinAccessProject macros
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitQuery: anObject [
	self
		push: self metrics newQueryMetric
		during: [ self metrics register: #Fields value: anObject fields size.
			(anObject fields collect: [ :f | f sourceTableName ]) asSet
				do: [ :n | self metrics registerDependancy: n kind: #Table].
			(anObject fields collect: [ :f | f typeName ]) asSet
				do: [ :n | self metrics registerDependancy: n kind: #DBType].
			super visitQuery: anObject ].
	anObject ensureUnload
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitReference: aRef [
	| metric |
	metric := self metrics newReferenceMetric.
	metric register: #BuiltIn value: aRef isBuiltIn.
	metric register: #Path value: aRef path.
	metric register: #Major value: aRef major.
	metric register: #Minor value: aRef minor.
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitReport: aReport [
	self
		push: self metrics newReportMetric
		during: [ 
			self loadMetricsFromFormOrReport: aReport.
			super visitReport: aReport. ].
	aReport ensureUnload
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitSourceCode: aSourceCode [
	| sourceMetrics |
	[ sourceMetrics := self sourceCodeMetrixExtractor
		metricsFor: aSourceCode ast ]
		on: Error
		do: [ :e | 
			sourceMetrics := JinAstMetric new
				register: #ERROR value: e messageText;
				yourself ].
	self metrics register: #ASTMetrics value: sourceMetrics
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitSubForm: aSubform [
	self metrics registerDependancy: aSubform name kind: #Form.
	super visitSubForm: aSubform
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitTable: anObject [
	self
		push: self metrics newTableMetric
		during: [ 
			self metrics register: #Fields value: anObject fields size.
			(anObject fields collect: [ :f | f typeName ]) asSet
				do: [ :n | self metrics registerDependancy: n kind: #DBType ].
			super visitTable: anObject ].
	anObject ensureUnload
]

{ #category : #'visit-first-objects' }
JinStructuralMetricsExtractor >> visitTableRelation: aJinTableRelation [
	"Should we include this?"
]
