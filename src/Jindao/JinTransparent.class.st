"
Class generated by JinControlClassBuilder at 2020-05-15T10:21:10.081165+02:00
=================================

"
Class {
	#name : #JinTransparent,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-MSAccess-ComponentProperties'
}

{ #category : #generated }
JinTransparent class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinTransparent
]

{ #category : #generated }
JinTransparent class >> mappedTypeName [
	^#'Transparent'
]

{ #category : #visit }
JinTransparent >> acceptVisitor: aVisitor [
	^ aVisitor visitTransparent: self.
]
