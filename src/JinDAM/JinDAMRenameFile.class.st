Class {
	#name : #JinDAMRenameFile,
	#superclass : #JinDAMEntity,
	#instVars : [
		'oldNameReference',
		'newNameReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMRenameFile >> accept: aMOJinDAMImporter [

	^ aMOJinDAMImporter visitRenameFile: self
]

{ #category : #accessing }
JinDAMRenameFile >> newNameReference [
	^ newNameReference
]

{ #category : #accessing }
JinDAMRenameFile >> newNameReference: aJinDAMAccessRead [ 
	newNameReference := aJinDAMAccessRead
]

{ #category : #accessing }
JinDAMRenameFile >> oldNameReference [
	^ oldNameReference
]

{ #category : #accessing }
JinDAMRenameFile >> oldNameReference: aJinDAMAccessRead [ 
	oldNameReference := aJinDAMAccessRead
]
