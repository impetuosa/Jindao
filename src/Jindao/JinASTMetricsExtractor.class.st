Class {
	#name : #JinASTMetricsExtractor,
	#superclass : #VBProgramNodeVisitor,
	#instVars : [
		'stack'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #initialization }
JinASTMetricsExtractor >> initialize [
	super initialize.
	stack := Stack new.
	stack push: JinAstMetric new
]

{ #category : #initialization }
JinASTMetricsExtractor >> metrics [
	^ stack top
]

{ #category : #initialization }
JinASTMetricsExtractor >> metricsFor: anAST [
	self metrics register: #LOC value: anAST source lines size.
	anAST acceptVisitor: self.
	^ self metrics
]

{ #category : #initialization }
JinASTMetricsExtractor >> push: aValue during: aBlock [
	stack push: aValue.
	aBlock
		ensure: [ stack pop ]
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitAsTypeAndNew: aTypeAndNew [
	self metrics
		registerDependancy: (aTypeAndNew source copyReplaceAll: 'As ' with: '')
		kind: #TypeAndNew
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitAssignementOrEquals: anObject [
	self metrics incrementCounterFor: #AssignmentOrEquality
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitConcatenationOperation: aConcatenationOperation [ 
	self metrics incrementCounterFor: #Concatenation.
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitDoUntilTrue: anObject [
	self metrics incrementCounterFor: #Loop
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitDoWhileTrue: anObject [
	self metrics incrementCounterFor: #Loop
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitExit: anObject [
	self metrics incrementCounterFor: #Exit
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitExplicitAssignement: anObject [
	self metrics incrementCounterFor: #ExplicitAssignment
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitForEach:  anObject [
	self metrics incrementCounterFor: #Loop
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitForNext:  anObject [
	self metrics incrementCounterFor: #Loop
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitForStepNext:  anObject [
	self metrics incrementCounterFor: #Loop
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitFunctionDefinition: aFunction [
	self
		push: self metrics newFunctionMetrics
		during: [ 
			self metrics register:#Name value: aFunction selector source.
			self metrics register:#LOC value: aFunction source lines size. 
			super visitFunctionDefinition: aFunction ]
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitGoSub: anObject [
	self metrics incrementCounterFor: #GoSub
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitIfThenColon: anObject [
	self metrics incrementCounterFor: #Branching
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitIfThenElse: anObject [
	self metrics incrementCounterFor: #Branching
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitIfThenElseIfElse: anObject [
	self metrics incrementCounterFor: #Branching
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitModuleProperty: aProperty [
	self
		push: self metrics newPropertyMetrics
		during: [ 
			self metrics register: #Name value: aProperty variable name source.
			super visitModuleProperty: aProperty.
		 ]
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitModulePropertyGet: aProperty [
	| accessorType |
	aProperty getToken ifNotNil: [ accessorType := #Get ].
	aProperty setToken ifNotNil: [ accessorType := #Set ].
	aProperty letToken ifNotNil: [ accessorType := #Let ].
	self assert: accessorType isNotNil.
	self
		push: self metrics newPropertyAccessorMetrics
		during: [ self metrics register: #Name value: aProperty selector source.
			self metrics register: #Type value: accessorType.
			super visitModuleProperty: aProperty ]
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitOnErrorGoTo: anObject [
	self metrics incrementCounterFor: #OnErrorGoTo
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitOnErrorResumeNext: onErrorResumeNext [
	self metrics incrementCounterFor: #OnErrorResumeNext
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitResumeEmpty: anObject [
	self metrics incrementCounterFor: #ResumeEmpty
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitResumeLabel: anObject [
	self metrics incrementCounterFor: #ResumeLabel
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitResumeNext: anObject [
	self metrics incrementCounterFor: #ResumeNext
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitReturn: anObject [
	self metrics incrementCounterFor: #Return
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitSelect: anObject [
	self metrics incrementCounterFor: #Branching
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitSubDefinition: aSub [
	self
		push: self metrics newSubMetrics
		during: [ 
			self metrics register: #Name value: aSub selector source.
			self metrics register: #LOC value: aSub source lines size.
			super visitSubDefinition: aSub ]
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitTypedThing: aTypedThing [
	self metrics
		registerDependancy: (aTypedThing source copyReplaceAll: 'As ' with: '')
		kind: #Type
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitWhileTrue: anObject [
	self metrics incrementCounterFor: #Loop
]

{ #category : #initialization }
JinASTMetricsExtractor >> visitWhileWend:  anObject [
	self metrics incrementCounterFor: #Loop
]
