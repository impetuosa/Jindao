"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:58.751165+02:00
=================================

"
Class {
	#name : #JinRowStart,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-ComponentProperties'
}

{ #category : #generated }
JinRowStart class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinRowStart
]

{ #category : #generated }
JinRowStart class >> mappedTypeName [
	^#'RowStart'
]

{ #category : #visit }
JinRowStart >> acceptVisitor: aVisitor [
	^ aVisitor visitRowStart: self.
]
