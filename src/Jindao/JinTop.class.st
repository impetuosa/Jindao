"
Class generated by JinControlClassBuilder at 2020-05-15T10:24:00.327165+02:00
=================================

"
Class {
	#name : #JinTop,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-ComponentProperties'
}

{ #category : #generated }
JinTop class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinTop
]

{ #category : #generated }
JinTop class >> mappedTypeName [
	^#'Top'
]

{ #category : #visit }
JinTop >> acceptVisitor: aVisitor [
	^ aVisitor visitTop: self.
]
