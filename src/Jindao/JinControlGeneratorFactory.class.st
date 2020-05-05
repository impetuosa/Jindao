Class {
	#name : #JinControlGeneratorFactory,
	#superclass : #JinControlsMappedTypesFactory,
	#instVars : [
		'builder'
	],
	#category : #'Jindao-Factories'
}

{ #category : #accessing }
JinControlGeneratorFactory >> builder [
	^ builder ifNil: [ JinControlClassBuilder ]
]

{ #category : #accessing }
JinControlGeneratorFactory >> builder: aBuilder [ 
	builder := aBuilder 
]

{ #category : #accessing }
JinControlGeneratorFactory >> classFor: aControl [
	^ self
		classFor: aControl
		ifNone: [ self generateClassControlFor: aControl ]
]

{ #category : #accessing }
JinControlGeneratorFactory >> generateClassControlFor: aControl [
	| builder |
	builder := self newBuilder.
	builder
		superclass: JinControl;
		name: aControl getTypeInfo name.
	aControl getTypeInfo properties do: [ :p | builder addProperty: p ].
	aControl getTypeInfo methods reject: [: p | p isProperty ] thenDo: [ :p | builder addMethod: p ].
	^ builder build
]

{ #category : #accessing }
JinControlGeneratorFactory >> newBuilder [
	^ self builder new 
]
