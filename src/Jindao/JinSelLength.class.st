"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:51.372165+02:00
=================================

"
Class {
	#name : #JinSelLength,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinSelLength class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinSelLength
]

{ #category : #generated }
JinSelLength class >> mappedTypeName [
	^#'SelLength'
]

{ #category : #visit }
JinSelLength >> acceptVisitor: aVisitor [
	^ aVisitor visitSelLength: self.
]