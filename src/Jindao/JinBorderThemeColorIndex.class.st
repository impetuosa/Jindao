"
Class generated by JinControlClassBuilder at 2020-05-15T10:24:01.230165+02:00
=================================

"
Class {
	#name : #JinBorderThemeColorIndex,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-ComponentProperties'
}

{ #category : #generated }
JinBorderThemeColorIndex class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinBorderThemeColorIndex
]

{ #category : #generated }
JinBorderThemeColorIndex class >> mappedTypeName [
	^#'BorderThemeColorIndex'
]

{ #category : #visit }
JinBorderThemeColorIndex >> acceptVisitor: aVisitor [
	^ aVisitor visitBorderThemeColorIndex: self.
]
