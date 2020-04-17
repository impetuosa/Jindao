Class {
	#name : #JinControlsMappedTypesFactory,
	#superclass : #JinControlsFactory,
	#category : #'Jindao-Factories'
}

{ #category : #accessing }
JinControlsMappedTypesFactory >> classFor: aControl ifNone: aBlock [
	^ JinControl subclasses
		detect: [ :a | self control: aControl mapsWith: a ]
		ifNone: [ aBlock value ]
]
