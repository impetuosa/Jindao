Class {
	#name : #JinComDocumentationControl,
	#superclass : #Object,
	#instVars : [
		'name',
		'api',
		'reference'
	],
	#category : #'Jindao-COMDoc'
}

{ #category : #'as yet unclassified' }
JinComDocumentationControl >> documents: aString [
	^ api includesKey: aString
]

{ #category : #'as yet unclassified' }
JinComDocumentationControl >> fileReference [
	^ reference
]

{ #category : #'as yet unclassified' }
JinComDocumentationControl >> fileReference: aFileReference [ 
	reference := aFileReference 
]

{ #category : #accessing }
JinComDocumentationControl >> initialize [
	super initialize.
	api := Dictionary new
]

{ #category : #'as yet unclassified' }
JinComDocumentationControl >> name [
	^ name
]

{ #category : #'as yet unclassified' }
JinComDocumentationControl >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinComDocumentationControl >> partNamed: aName [
	^ api
		at: aName
		ifAbsentPut: [ JinComDocumentationApiEntry new
				name: aName;
				yourself ]
]
