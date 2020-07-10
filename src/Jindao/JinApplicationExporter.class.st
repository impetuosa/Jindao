"
I do export first citizen from an application 
"
Class {
	#name : #JinApplicationExporter,
	#superclass : #JinStackVisitor,
	#instVars : [
		'folder'
	],
	#category : #'Jindao-Exporting'
}

{ #category : #'visit-first-objects' }
JinApplicationExporter >> export: anObject [
	anObject exportToFolder: folder
]

{ #category : #'as yet unclassified' }
JinApplicationExporter >> folder: aFileReference [ 
	folder := aFileReference.
	aFileReference ensureCreateDirectory 
]

{ #category : #'visit-first-objects' }
JinApplicationExporter >> visitForm: aForm [
	self export: aForm.
]

{ #category : #'visit-first-objects' }
JinApplicationExporter >> visitMacro: anObject [
	self export: anObject.
]

{ #category : #'visit-first-objects' }
JinApplicationExporter >> visitModule: anObject [
	self export: anObject.
]

{ #category : #'visit-first-objects' }
JinApplicationExporter >> visitProject: aJinAccessProject [
	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject reports.
	self visitCollection: aJinAccessProject forms.
	self visitCollection: aJinAccessProject tables.
	self visitCollection: aJinAccessProject queries.

	"	self visitCollection: aJinAccessProject macros."
]

{ #category : #'visit-first-objects' }
JinApplicationExporter >> visitQuery: anObject [
	self export: anObject.
]

{ #category : #'visit-first-objects' }
JinApplicationExporter >> visitReport: anObject [
	self export: anObject.
]

{ #category : #'visit-first-objects' }
JinApplicationExporter >> visitTable: anObject [
	[self export: anObject.] on: Error do: [ :e |  ]
]
