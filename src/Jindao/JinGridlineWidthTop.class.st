"
Class generated by JinControlClassBuilder at 2020-05-15T10:24:03.534165+02:00
=================================

"
Class {
	#name : #JinGridlineWidthTop,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-MSAccess-ComponentProperties'
}

{ #category : #generated }
JinGridlineWidthTop class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinGridlineWidthTop
]

{ #category : #generated }
JinGridlineWidthTop class >> mappedTypeName [
	^#'GridlineWidthTop'
]

{ #category : #visit }
JinGridlineWidthTop >> acceptVisitor: aVisitor [
	^ aVisitor visitGridlineWidthTop: self.
]
