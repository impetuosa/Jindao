"
I represent a  print into statement 
"
Class {
	#name : #JinDAMFilePrintIntoClause,
	#superclass : #JinDAMEntity,
	#instVars : [
		'fileDescriptorReference',
		'printingReferences'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMFilePrintIntoClause >> accept: aMOJinDAMImporter [

	^ aMOJinDAMImporter visitFilePrintInto: self
]

{ #category : #accessing }
JinDAMFilePrintIntoClause >> fileDescriptorReference [
	^ fileDescriptorReference
]

{ #category : #accessing }
JinDAMFilePrintIntoClause >> fileDescriptorReference: aJinDAMAccessRead [ 
	fileDescriptorReference := aJinDAMAccessRead
]

{ #category : #accessing }
JinDAMFilePrintIntoClause >> printingReferences [
	^ printingReferences
]

{ #category : #accessing }
JinDAMFilePrintIntoClause >> printingReferences: aCollection [ 
	printingReferences := aCollection
]
