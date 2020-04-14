Class {
	#name : #JinControlGeneratorFactory,
	#superclass : #JinControlsFactory,
	#category : #'Jindao-Factories'
}

{ #category : #accessing }
JinControlGeneratorFactory >> classFor: aControl [
	^ self
		classFor: aControl
		ifNone: [ self generateClassControlFor: aControl ]
]

{ #category : #accessing }
JinControlGeneratorFactory >> generateClassControlFor: aControl [
	| builder |
	builder := JinControlClassBuilder new.
	builder
		superclass: JinControl;
		name: aControl getTypeInfo name.
	aControl getTypeInfo properties do: [ :p | builder addProperty: p ].
	aControl getTypeInfo methods do: [ :p | builder addMethod: p ].
	^ builder build
]
