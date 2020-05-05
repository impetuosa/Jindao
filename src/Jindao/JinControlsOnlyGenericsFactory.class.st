Class {
	#name : #JinControlsOnlyGenericsFactory,
	#superclass : #JinControlsFactory,
	#category : #'Jindao-Factories'
}

{ #category : #accessing }
JinControlsOnlyGenericsFactory >> classFor: aControl ifNone: aBlock [
	^ JinControlGeneric
]
