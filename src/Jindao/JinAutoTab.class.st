"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:49.701165+02:00
=================================

"
Class {
	#name : #JinAutoTab,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinAutoTab class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinAutoTab
]

{ #category : #generated }
JinAutoTab class >> mappedTypeName [
	^#'AutoTab'
]

{ #category : #visit }
JinAutoTab >> acceptVisitor: aVisitor [
	^ aVisitor visitAutoTab: self.
]