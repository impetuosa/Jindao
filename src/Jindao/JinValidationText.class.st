"
Class generated by JinControlClassBuilder at 2020-05-15T10:24:05.696165+02:00
=================================

"
Class {
	#name : #JinValidationText,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-ComponentProperties'
}

{ #category : #generated }
JinValidationText class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinValidationText
]

{ #category : #generated }
JinValidationText class >> mappedTypeName [
	^#'ValidationText'
]

{ #category : #visit }
JinValidationText >> acceptVisitor: aVisitor [
	^ aVisitor visitValidationText: self.
]
