"
Class generated by JinControlClassBuilder at 2020-05-15T10:22:25.504165+02:00
=================================

"
Class {
	#name : #JinGradient,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinGradient class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinGradient
]

{ #category : #generated }
JinGradient class >> mappedTypeName [
	^#'Gradient'
]

{ #category : #visit }
JinGradient >> acceptVisitor: aVisitor [
	^ aVisitor visitGradient: self.
]