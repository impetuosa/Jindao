"
Class generated by JinControlClassBuilder at 2020-05-15T10:22:27.688165+02:00
=================================

"
Class {
	#name : #JinPressedForeShade,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinPressedForeShade class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinPressedForeShade
]

{ #category : #generated }
JinPressedForeShade class >> mappedTypeName [
	^#'PressedForeShade'
]

{ #category : #visit }
JinPressedForeShade >> acceptVisitor: aVisitor [
	^ aVisitor visitPressedForeShade: self.
]