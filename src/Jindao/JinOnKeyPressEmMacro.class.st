"
Class generated by JinControlClassBuilder at 2020-05-15T10:24:08.303165+02:00
=================================

"
Class {
	#name : #JinOnKeyPressEmMacro,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinOnKeyPressEmMacro class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinOnKeyPressEmMacro
]

{ #category : #generated }
JinOnKeyPressEmMacro class >> mappedTypeName [
	^#'OnKeyPressEmMacro'
]

{ #category : #visit }
JinOnKeyPressEmMacro >> acceptVisitor: aVisitor [
	^ aVisitor visitOnKeyPressEmMacro: self.
]