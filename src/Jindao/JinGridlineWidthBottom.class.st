"
Class generated by JinControlClassBuilder at 2020-05-15T10:24:03.609165+02:00
=================================

"
Class {
	#name : #JinGridlineWidthBottom,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinGridlineWidthBottom class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinGridlineWidthBottom
]

{ #category : #generated }
JinGridlineWidthBottom class >> mappedTypeName [
	^#'GridlineWidthBottom'
]

{ #category : #visit }
JinGridlineWidthBottom >> acceptVisitor: aVisitor [
	^ aVisitor visitGridlineWidthBottom: self.
]