"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:58.548165+02:00
=================================

"
Class {
	#name : #JinInSelection,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinInSelection class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinInSelection
]

{ #category : #generated }
JinInSelection class >> mappedTypeName [
	^#'InSelection'
]

{ #category : #visit }
JinInSelection >> acceptVisitor: aVisitor [
	^ aVisitor visitInSelection: self.
]