"
Class generated by JinControlClassBuilder at 2020-05-15T10:24:08.610165+02:00
=================================

"
Class {
	#name : #JinOnExitEmMacro,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinOnExitEmMacro class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinOnExitEmMacro
]

{ #category : #generated }
JinOnExitEmMacro class >> mappedTypeName [
	^#'OnExitEmMacro'
]

{ #category : #visit }
JinOnExitEmMacro >> acceptVisitor: aVisitor [
	^ aVisitor visitOnExitEmMacro: self.
]