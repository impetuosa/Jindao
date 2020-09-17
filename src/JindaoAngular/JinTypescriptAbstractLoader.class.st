Class {
	#name : #JinTypescriptAbstractLoader,
	#superclass : #JSProgramNodeVisitor,
	#instVars : [
		'result',
		'file'
	],
	#category : #JindaoAngular
}

{ #category : #actions }
JinTypescriptAbstractLoader class >> load: aJSDecoratorExpressionNode file: aFile [ 

	| loader |
	loader := self new.
	aJSDecoratorExpressionNode acceptVisitor: loader.
	loader result anchorFrom: aJSDecoratorExpressionNode at: aFile. 
	^ loader result
]

{ #category : #accessing }
JinTypescriptAbstractLoader >> file: aFile [
	file := aFile 
]

{ #category : #accessing }
JinTypescriptAbstractLoader >> result [
	^ result 
]
