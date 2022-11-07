Class {
	#name : #JinComDocumentationModule,
	#superclass : #Object,
	#instVars : [
		'components',
		'name',
		'reference'
	],
	#category : #'Jindao-COMDoc'
}

{ #category : #'as yet unclassified' }
JinComDocumentationModule >> controlNamed: aString [ 
	|comp| 
	comp := aString asLowercase.
	^ components values detect:  [ : k | k name asLowercase = comp ] 
]

{ #category : #'as yet unclassified' }
JinComDocumentationModule >> fileReference: aFileReference [ 
	reference := aFileReference 
]

{ #category : #accessing }
JinComDocumentationModule >> initialize [
	super initialize.
	components := Dictionary new
]

{ #category : #accessing }
JinComDocumentationModule >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinComDocumentationModule >> partNamed: aName [
	^ components
		at: aName
		ifAbsentPut: [ JinComDocumentationControl new
				name: aName;
				yourself ]
]
