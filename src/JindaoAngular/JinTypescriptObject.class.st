Class {
	#name : #JinTypescriptObject,
	#superclass : #Object,
	#instVars : [
		'name',
		'anchor'
	],
	#category : #JindaoAngular
}

{ #category : #'as yet unclassified' }
JinTypescriptObject >> anchorFrom: aJSDecoratorExpressionNode at: aFileReference [

	| start stop |
	start := aJSDecoratorExpressionNode startPosition.
	stop := aJSDecoratorExpressionNode stopPosition.

	anchor := JinAnchor new
		          start: start;
		          stop: stop;
		          file: aFileReference;
		          yourself
]

{ #category : #accessing }
JinTypescriptObject >> name [

	^ name
]

{ #category : #accessing }
JinTypescriptObject >> name: aName [

	name := aName
]

{ #category : #generated }
JinTypescriptObject >> sourceCode [
	^ anchor sourceCode 
]

{ #category : #generated }
JinTypescriptObject >> type [
	^ self class name copyReplaceAll:'JinTypescript' with: ''
]
