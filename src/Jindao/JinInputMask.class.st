"
Class generated by JinControlClassBuilder at 2020-05-15T10:24:05.423165+02:00
=================================

"
Class {
	#name : #JinInputMask,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-ComponentProperties'
}

{ #category : #generated }
JinInputMask class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinInputMask
]

{ #category : #generated }
JinInputMask class >> mappedTypeName [
	^#'InputMask'
]

{ #category : #visit }
JinInputMask >> acceptVisitor: aVisitor [
	^ aVisitor visitInputMask: self.
]
