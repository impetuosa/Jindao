"
Class generated by JinControlClassBuilder at 2020-05-15T10:22:25.416165+02:00
=================================

"
Class {
	#name : #JinShape,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-ComponentProperties'
}

{ #category : #generated }
JinShape class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinShape
]

{ #category : #generated }
JinShape class >> mappedTypeName [
	^#'Shape'
]

{ #category : #visit }
JinShape >> acceptVisitor: aVisitor [
	^ aVisitor visitShape: self.
]
