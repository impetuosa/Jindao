"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:49.987165+02:00
=================================

"
Class {
	#name : #JinIMEHold,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinIMEHold class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinIMEHold
]

{ #category : #generated }
JinIMEHold class >> mappedTypeName [
	^#'IMEHold'
]

{ #category : #visit }
JinIMEHold >> acceptVisitor: aVisitor [
	^ aVisitor visitIMEHold: self.
]