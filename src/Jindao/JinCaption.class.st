"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:52.537165+02:00
=================================

"
Class {
	#name : #JinCaption,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-MSAccess-ComponentProperties'
}

{ #category : #generated }
JinCaption class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinCaption
]

{ #category : #generated }
JinCaption class >> mappedTypeName [
	^#'Caption'
]

{ #category : #visit }
JinCaption >> acceptVisitor: aVisitor [
	^ aVisitor visitCaption: self.
]
