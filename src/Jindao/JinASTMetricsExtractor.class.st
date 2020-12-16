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
	stack := Stack new
]

{ #category : #initialization }
JinASTMetricsExtractor >> metrics [
	^ stack top
]

{ #category : #initialization }
JinASTMetricsExtractor >> metricsFor: anAST [
	self halt. 
	anAST accept: self.
	^ self metrics
]

{ #category : #initialization }
JinASTMetricsExtractor >> push: aValue during: aBlock [
	stack push: aValue.
	aBlock
		ensure: [ stack pop ]
]
