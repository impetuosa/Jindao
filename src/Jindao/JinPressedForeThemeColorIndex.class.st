"
Class generated by JinControlClassBuilder at 2020-05-15T10:22:27.467165+02:00
=================================

"
Class {
	#name : #JinPressedForeThemeColorIndex,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinPressedForeThemeColorIndex class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinPressedForeThemeColorIndex
]

{ #category : #generated }
JinPressedForeThemeColorIndex class >> mappedTypeName [
	^#'PressedForeThemeColorIndex'
]

{ #category : #visit }
JinPressedForeThemeColorIndex >> acceptVisitor: aVisitor [
	^ aVisitor visitPressedForeThemeColorIndex: self.
]