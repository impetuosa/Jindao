"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:51.088165+02:00
=================================

"
Class {
	#name : #JinText,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinText class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinText
]

{ #category : #generated }
JinText class >> mappedTypeName [
	^#'Text'
]

{ #category : #visit }
JinText >> acceptVisitor: aVisitor [
	^ aVisitor visitText: self.
]