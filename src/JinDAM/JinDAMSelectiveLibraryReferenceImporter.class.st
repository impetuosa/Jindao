Class {
	#name : #JinDAMSelectiveLibraryReferenceImporter,
	#superclass : #JinDAMLibraryReferenceImporter,
	#instVars : [
		'block'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #accessing }
JinDAMSelectiveLibraryReferenceImporter >> block: aBlock [

	block := aBlock
]

{ #category : #visiting }
JinDAMSelectiveLibraryReferenceImporter >> new [

	^ self
]

{ #category : #visiting }
JinDAMSelectiveLibraryReferenceImporter >> visitCollection: aCollection [

	^ super visitCollection:
		  (aCollection select: [ :a | block value: a ])
]
