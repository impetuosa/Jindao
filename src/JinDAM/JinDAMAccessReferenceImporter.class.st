Class {
	#name : #JinDAMAccessReferenceImporter,
	#superclass : #JinAccessReferenceVisitor,
	#category : #'JinDAM-Importers'
}

{ #category : #visiting }
JinDAMAccessReferenceImporter >> visitReference: anAccessModule [
	| project |
	project := JinAccessApplication default open:
		           anAccessModule path asFileReference.

	project acceptVisitor: self.
	project closeAndQuit
]
