"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:50.193165+02:00
=================================

"
Class {
	#name : #JinIMESentenceMode,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-ComponentProperties'
}

{ #category : #generated }
JinIMESentenceMode class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinIMESentenceMode
]

{ #category : #generated }
JinIMESentenceMode class >> mappedTypeName [
	^#'IMESentenceMode'
]

{ #category : #visit }
JinIMESentenceMode >> acceptVisitor: aVisitor [
	^ aVisitor visitIMESentenceMode: self.
]
