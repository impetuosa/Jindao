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

	anchor := JinAnchor new
		          start:
			          (aJSDecoratorExpressionNode attributes at: #startPosition);
		          stop:
			          (aJSDecoratorExpressionNode attributes at: #stopPosition);
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
