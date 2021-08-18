Class {
	#name : #JinDAMImporter,
	#superclass : #Object,
	#instVars : [
		'provider',
		'symbolTable'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #accessing }
JinDAMImporter >> createDefaultVisitor [
	^ provider build
]

{ #category : #accessing }
JinDAMImporter >> import: aProjectPath [
	^ self import: aProjectPath into: JinDAMModel new
]

{ #category : #accessing }
JinDAMImporter >> import: aProjectPath into: aModel [
	| project visitor |
	project := JinAccessApplication default open: aProjectPath.
	visitor := self visitorFor: aModel.
	[ 
		project acceptVisitor: visitor.
 		self link: aModel. 
		^ aModel.  
	]
		ensure: [ project closeAndQuit ].
]

{ #category : #accessing }
JinDAMImporter >> import: aProjectPath symbolTable: aSymbolTable [

	symbolTable := aSymbolTable.

	^ self import: aProjectPath
]

{ #category : #accessing }
JinDAMImporter >> import: aProjectPath symbolTableAt: aString [

	| symbolTableBuilder project |
	aString asFileReference exists
		ifTrue: [ 
		symbolTable := JinNSSymbolTable loadFrom: aString asFileReference ]
		ifFalse: [ 
			project := JinAccessApplication default open: aProjectPath.
			symbolTableBuilder := JinNSBuilder new.
			symbolTable := symbolTableBuilder buildFor: project.
			symbolTable saveAs: aString asFileReference.
			project closeAndQuit ].
	^ self import: aProjectPath
]

{ #category : #accessing }
JinDAMImporter >> initialize [
	super initialize.
	provider := JinDAMImportingVisitorProvider new 
]

{ #category : #accessing }
JinDAMImporter >> link: aJinDAMModel [

	aJinDAMModel references do: [ :r | 
		r candidate ifNil: [ 
			r candidateAnchor ifNotNil: [ 
				| artefact |
				artefact := aJinDAMModel entities detect: [ :e | 
					            (e isKindOf: JinDAMArtefact) and: [ 
						            e name = r candidateAnchor elementProject and: [ 
							            e isReference not ] ] ].
				r candidate: (r candidateAnchor elementsNameKindPairs
						 inject: artefact
						 into: [ :nav :each | nav find: each second named: each first ]) ] ] ]
]

{ #category : #accessing }
JinDAMImporter >> provider [
	^ provider
]

{ #category : #accessing }
JinDAMImporter >> visitorFor: aModel [

	^ self createDefaultVisitor
		  model: aModel;
		  symbolTable: symbolTable;
		  yourself
]
