"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:55.566165+02:00
=================================

"
Class {
	#name : #JinHyperlinkBinderDescription,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinHyperlinkBinderDescription class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinHyperlinkBinderDescription
]

{ #category : #generated }
JinHyperlinkBinderDescription class >> mappedTypeName [
	^#'HyperlinkBinderDescription'
]

{ #category : #visit }
JinHyperlinkBinderDescription >> acceptVisitor: aVisitor [
	^ aVisitor visitHyperlinkBinderDescription: self.
]