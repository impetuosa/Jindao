Class {
	#name : #JinTypescriptDecorator,
	#superclass : #JinTypescriptObject,
	#instVars : [
		'attributes'
	],
	#category : #JindaoAngular
}

{ #category : #accessing }
JinTypescriptDecorator >> attributes [
	^ attributes ifNil: [  attributes := Dictionary new.  ]
]
