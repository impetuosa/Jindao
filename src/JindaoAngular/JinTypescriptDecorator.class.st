Class {
	#name : #JinTypescriptDecorator,
	#superclass : #JinTypescriptObject,
	#instVars : [
		'attributes'
	],
	#category : #JindaoAngular
}

{ #category : #visiting }
JinTypescriptDecorator >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitTypescriptDecorator: self 
]

{ #category : #accessing }
JinTypescriptDecorator >> attributes [
	^ attributes ifNil: [  attributes := Dictionary new.  ]
]
