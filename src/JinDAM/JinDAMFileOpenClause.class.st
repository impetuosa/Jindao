Class {
	#name : #JinDAMFileOpenClause,
	#superclass : #JinDAMEntity,
	#instVars : [
		'filePathReference',
		'kind',
		'fileDescriptorReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMFileOpenClause >> accept: aVisitor [

	^ aVisitor visitOpenClause: self
]

{ #category : #accessing }
JinDAMFileOpenClause >> fileDescriptorReference [
	^ fileDescriptorReference
]

{ #category : #accessing }
JinDAMFileOpenClause >> fileDescriptorReference: aJinDAMAccessRead [ 
	fileDescriptorReference := aJinDAMAccessRead
]

{ #category : #accessing }
JinDAMFileOpenClause >> filePathReference [
	^ filePathReference
]

{ #category : #accessing }
JinDAMFileOpenClause >> filePathReference: aJinDAMAccessRead [ 
	filePathReference := aJinDAMAccessRead
]

{ #category : #accessing }
JinDAMFileOpenClause >> kind [
	^ kind
]

{ #category : #accessing }
JinDAMFileOpenClause >> kind: aString [ 
	kind := aString
]
