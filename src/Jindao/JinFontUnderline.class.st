"
Class generated by JinControlClassBuilder at 2020-05-15T10:24:02.205165+02:00
=================================

"
Class {
	#name : #JinFontUnderline,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-ComponentProperties'
}

{ #category : #generated }
JinFontUnderline class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinFontUnderline
]

{ #category : #generated }
JinFontUnderline class >> mappedTypeName [
	^#'FontUnderline'
]

{ #category : #visit }
JinFontUnderline >> acceptVisitor: aVisitor [
	^ aVisitor visitFontUnderline: self.
]
