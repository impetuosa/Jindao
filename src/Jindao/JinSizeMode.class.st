"
Class generated by JinControlClassBuilder at 2020-05-15T10:20:37.823165+02:00
=================================

"
Class {
	#name : #JinSizeMode,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinSizeMode class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinSizeMode
]

{ #category : #generated }
JinSizeMode class >> mappedTypeName [
	^#'SizeMode'
]

{ #category : #visit }
JinSizeMode >> acceptVisitor: aVisitor [
	^ aVisitor visitSizeMode: self.
]