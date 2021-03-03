Class {
	#name : #JinSourcedEntity,
	#superclass : #JinStructuralMetric,
	#instVars : [
		'source',
		'sourceMetrics'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #accessing }
JinSourcedEntity >> allDependencies [
	| base |
	base := super allDependencies.
	sourceMetrics
		ifNotNil: [ sourceMetrics hadErrorOnCalculation
				ifFalse: [ base := base , sourceMetrics allDependencies ] ].
	^ base
]

{ #category : #accessing }
JinSourcedEntity >> ast [
	| semaphore result |
	semaphore := Semaphore new.
	[ [ result := (self class environment at: #VBParser) parse: source ]
		on: Error
		do: [ :e | result := e ].
	semaphore signal ] forkAt: Processor userBackgroundPriority.
	^ semaphore
		wait: 5 minute
		onCompletion: [ result isError
				ifTrue: [ ^ result signal ].
			result ]
		onTimeout: [ TimedOut new signal: 'TimeOut' ]
]

{ #category : #accessing }
JinSourcedEntity >> branchings [
	<cvs: #Branching at: 11>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics branchings
]

{ #category : #accessing }
JinSourcedEntity >> calculatedSourceMetrics [
	^ sourceMetrics
]

{ #category : #'as yet unclassified' }
JinSourcedEntity >> codeElement: aString [
	sourceMetrics ifNil: [ ^ {} ].
	^ sourceMetrics children
		select: [ :c | c properties includesKey: aString asSymbol ]
]

{ #category : #'as yet unclassified' }
JinSourcedEntity >> codeElementValue: aString [
	sourceMetrics ifNil: [ ^ 0 ].
	^ sourceMetrics children
		select: [ :c | c properties includesKey: aString asSymbol ]
		thenCollect: [ :c | c properties at: aString ]
]

{ #category : #accessing }
JinSourcedEntity >> dropAstMetrics [
	sourceMetrics := nil
]

{ #category : #accessing }
JinSourcedEntity >> functions [
	<cvs: #Functions at: 10>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics functions size
]

{ #category : #'as yet unclassified' }
JinSourcedEntity >> hadSyntaxErrorOnCalculation [
	sourceMetrics ifNil: [ ^ false ].
	sourceMetrics hadErrorOnCalculation ifFalse: [ ^ false ].
	^ (sourceMetrics properties at:#ERROR) = 'Token not expected'
]

{ #category : #'as yet unclassified' }
JinSourcedEntity >> hadTimeOutErrorOnCalculation [
	sourceMetrics ifNil: [ ^ false ].
	sourceMetrics hadErrorOnCalculation ifFalse: [ ^ false ].
	^ ((sourceMetrics properties at:#ERROR) = 'Token not expected') not
]

{ #category : #accessing }
JinSourcedEntity >> loops [
	<cvs: #Loop at: 11>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics loops
]

{ #category : #accessing }
JinSourcedEntity >> onErrorGoTos [
	<cvs: #OnErrorGoTo at: 13>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics onErrorGoTos
]

{ #category : #accessing }
JinSourcedEntity >> onErrorResumeNext [
	<cvs: #ErrorResumeNext at: 13>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics onErrorResumeNext
]

{ #category : #accessing }
JinSourcedEntity >> propertyAccessors [
	<cvs: #PropertiesAccessors at: 12>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics propertyAccessors size
]

{ #category : #accessing }
JinSourcedEntity >> propetiesDefined [
	<cvs: #Properties at: 12>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics property size
]

{ #category : #accessing }
JinSourcedEntity >> resumeLabels [
	<cvs: #ResumeLabel at: 13>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics resumeLabels
]

{ #category : #accessing }
JinSourcedEntity >> resumeNext [
	<cvs: #ResumeNext at: 13>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics resumeNext
]

{ #category : #accessing }
JinSourcedEntity >> resumes [
	<cvs: #ResumeEmpty at: 13>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics resumes
]

{ #category : #accessing }
JinSourcedEntity >> solveDependanciesWith: aRoot [

	super solveDependanciesWith: aRoot.
	sourceMetrics ifNil: [ ^ self ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ self ].
	sourceMetrics solveDependanciesWith: aRoot
]

{ #category : #accessing }
JinSourcedEntity >> source [
	^ source 
]

{ #category : #accessing }
JinSourcedEntity >> source: aSource [
	source := aSource. 
]

{ #category : #accessing }
JinSourcedEntity >> sourceCodeMetrixExtractor [
	^ JinASTMetricsExtractor new
]

{ #category : #accessing }
JinSourcedEntity >> sourceMetrics [
	[ sourceMetrics := self sourceCodeMetrixExtractor
		metricsFor: self ast ]
		on: SmaCCParserError , TimedOut , Win32Error
		do: [ :e | 
			sourceMetrics := JinAstMetric new
				register: #ERROR value: e messageText;
				yourself ].
	^ sourceMetrics
]

{ #category : #accessing }
JinSourcedEntity >> sourceMetricsIfError [
	sourceMetrics
		ifNotNil: [ sourceMetrics hadErrorOnCalculation
				ifFalse: [ ^ sourceMetrics ] ].
	sourceMetrics := nil. 
	^ self sourceMetrics
]

{ #category : #accessing }
JinSourcedEntity >> subs [
	<cvs: #SubProcedures at: 11>
	sourceMetrics ifNil: [ ^ 0 ].
	sourceMetrics hadErrorOnCalculation
		ifTrue: [ ^ 'Unknown' ].
	^ sourceMetrics subs size
]
