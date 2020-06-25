Class {
	#name : #FuExporter,
	#superclass : #JinStackVisitor,
	#instVars : [
		'folder'
	],
	#category : #'Jindao-FuZhi'
}

{ #category : #'visit-first-objects' }
FuExporter >> export: anObject [
	anObject exportToFolder: folder
]

{ #category : #'as yet unclassified' }
FuExporter >> folder: aFileReference [ 
	folder := aFileReference.
	aFileReference ensureCreateDirectory 
]

{ #category : #'visit-first-objects' }
FuExporter >> visitForm: aForm [
	self export: aForm.
]

{ #category : #'visit-first-objects' }
FuExporter >> visitMacro: anObject [
	self export: anObject.
]

{ #category : #'visit-first-objects' }
FuExporter >> visitModule: anObject [
	self export: anObject.
]

{ #category : #'visit-first-objects' }
FuExporter >> visitProject: aJinAccessProject [
	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject reports.
	self visitCollection: aJinAccessProject forms

	"	self visitCollection: aJinAccessProject macros."
]

{ #category : #'visit-first-objects' }
FuExporter >> visitQuery: anObject [
	self export: anObject.
]

{ #category : #'visit-first-objects' }
FuExporter >> visitReport: anObject [
	self export: anObject.
]

{ #category : #'visit-first-objects' }
FuExporter >> visitTable: anObject [
	self export: anObject.
]
