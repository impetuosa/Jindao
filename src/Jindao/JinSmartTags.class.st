"
Class generated by JinControlClassBuilder at 2020-05-15T10:23:58.319165+02:00
=================================

"
Class {
	#name : #JinSmartTags,
	#superclass : #JinAccessPropertyGenerated,
	#category : #'Jindao-GeneralObjects-GeneratedProperties'
}

{ #category : #generated }
JinSmartTags class >> acceptVisitor: aVisitor [
	^ aVisitor visitJinSmartTags
]

{ #category : #generated }
JinSmartTags class >> mappedTypeName [
	^#'SmartTags'
]

{ #category : #visit }
JinSmartTags >> acceptVisitor: aVisitor [
	^ aVisitor visitSmartTags: self.
]