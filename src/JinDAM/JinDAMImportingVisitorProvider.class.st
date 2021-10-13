Class {
	#name : #JinDAMImportingVisitorProvider,
	#superclass : #Object,
	#instVars : [
		'codeVisitor',
		'databaseVisitor',
		'guiVisitor',
		'controlVisitor',
		'syntaxVisitor',
		'projectVisitor',
		'filter',
		'referenceAccessVisitor',
		'referenceLibraryVisitor',
		'savingPhases'
	],
	#category : #'JinDAM-Importer-Helpers'
}

{ #category : #building }
JinDAMImportingVisitorProvider >> build [

	^ JinDAMDispatchingImporter new
		  savingPhases: self savingPhases;
		  code: self codeVisitorInstance;
		  database: self databaseVisitorInstance;
		  gui: self guiVisitorInstance;
		  control: self controlVisitorInstance;
		  syntax: self syntaxVisitorInstance;
		  project: self projectVisitorInstance;
		  referenceAccess: self referenceAccessVisitorInstance;
		  referenceLibrary: self referenceLibraryVisitorInstance;
		  yourself
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> codeVisitorInstance [
	^ self instantiate: codeVisitor
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> controlVisitorInstance [
	^ self instantiate: controlVisitor
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> databaseVisitorInstance [
	^ self instantiate: databaseVisitor
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> filtering: aBlock [
	filter := aBlock
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> guiVisitorInstance [
	^ self instantiate: guiVisitor
]

{ #category : #configuration }
JinDAMImportingVisitorProvider >> importAccessReferences [

	referenceAccessVisitor := JinDAMAccessReferenceImporter
]

{ #category : #configuration }
JinDAMImportingVisitorProvider >> importCodeElements [
	codeVisitor := JinDAMCodeImporter
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> importDatabase [

	databaseVisitor := JinDAMDatabaseImporter
]

{ #category : #configuration }
JinDAMImportingVisitorProvider >> importGUIControlElements [
	controlVisitor := JinDAMGUIControlImporter
]

{ #category : #configuration }
JinDAMImportingVisitorProvider >> importGUIElements [
	guiVisitor := JinDAMGUIImporter
]

{ #category : #configuration }
JinDAMImportingVisitorProvider >> importLibraryReferences [
	referenceLibraryVisitor := JinDAMLibraryReferenceImporter 
]

{ #category : #configuration }
JinDAMImportingVisitorProvider >> importProjectElements [
	projectVisitor := JinDAMProjectImporter
]

{ #category : #configuration }
JinDAMImportingVisitorProvider >> importSyntacticElements [
	syntaxVisitor := JinDAMASTCodeImporter
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> instantiate: aClassOrNil [
	^ aClassOrNil ifNotNil: [ aClassOrNil new ] 
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> projectVisitorInstance [
	^ self instantiate: projectVisitor
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> referenceAccessVisitorInstance [ 
	^ self instantiate: referenceAccessVisitor
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> referenceLibraryVisitorInstance [ 
	^ self instantiate: referenceLibraryVisitor
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> savingPhases [

	^ savingPhases ifNil: [ false ]
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> savingPhases: aBool [

	savingPhases := aBool
]

{ #category : #'instantiate parts' }
JinDAMImportingVisitorProvider >> syntaxVisitorInstance [
	^ self instantiate: syntaxVisitor
]
