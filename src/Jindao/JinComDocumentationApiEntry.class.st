Class {
	#name : #JinComDocumentationApiEntry,
	#superclass : #Object,
	#instVars : [
		'reference',
		'name'
	],
	#category : #'Jindao-COMDoc'
}

{ #category : #'as yet unclassified' }
JinComDocumentationApiEntry >> fileReference [
	^ reference
]

{ #category : #'as yet unclassified' }
JinComDocumentationApiEntry >> fileReference: aFileReference [ 
	reference := aFileReference 
]

{ #category : #'as yet unclassified' }
JinComDocumentationApiEntry >> name: aString [ 
	name := aString
]

{ #category : #'as yet unclassified' }
JinComDocumentationApiEntry >> partNamed: aString [ 
	name := name , '.', aString 
]
