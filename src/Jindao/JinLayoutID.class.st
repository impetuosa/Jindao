"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:58.672165+02:00
=================================

"
Class {
	#name : #JinLayoutID,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-ComponentProperties'
}

{ #category : #generated }
JinLayoutID class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinLayoutID
]

{ #category : #generated }
JinLayoutID class >> mappedTypeName [
	^#'LayoutID'
]

{ #category : #visit }
JinLayoutID >> acceptVisitor: aVisitor [
	^ aVisitor visitLayoutID: self.
]
