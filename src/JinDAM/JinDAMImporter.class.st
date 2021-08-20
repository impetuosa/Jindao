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

	| references |
	references := aJinDAMModel references.

	references
		select: [ :r | r isKindOf: JinDAMTypeReference ]
		thenDo: [ :r | self linkReference: r in: aJinDAMModel ].
	references
		reject: [ :r | r isKindOf: JinDAMTypeReference ]
		thenDo: [ :r | self linkReference: r in: aJinDAMModel ]
]

{ #category : #accessing }
JinDAMImporter >> linkReference: r in: aJinDAMModel [

	| candidates |
	r candidate ifNil: [ 
		r candidateAnchor ifNil: [ 
			({ 'NULL'. 'ERROR'. 'CARRAY'. 'SAFEARRAY'. 'ParamArray'. 'HRESULT' .
			 'COMUnknownInstance'. 'COMDispatchInstance' . 'USERDEFINED*' } includes: r name) 
				ifTrue: [ ^ self ].
			r context isReadAccess ifTrue: [ ^ self ].

			self assert: r context isReference.
			r context candidate ifNil: [ 
				self linkReference: r context in: aJinDAMModel ].
			candidates := r context candidateType
				              findAttributeInvocable: r name
				              amountArguments: r arguments size.

			candidates
				ifEmpty: [ self assert: r isDictionaryAccess ]
				ifNotEmpty: [ 
					self assert: (candidates size = 1 or: [ 
							 (candidates collect: [ :c | c typeReference name ]) asSet size
							 = 1 and: [ 
								 (candidates collect: [ :c | c parametersSize ]) asSet size
								 = 1 ] ]).
					candidates size = 1
						ifTrue: [ 
							r candidateAnchor: candidates first anchor.
							r candidate: candidates first ]
						ifFalse: [ r candidate: candidates ] ].
			^ self ].


		r candidateAnchor ifNotNil: [ 
			| artefact |
			artefact := aJinDAMModel entities detect: [ :e | 
				            (e isKindOf: JinDAMArtefact) and: [ 
					            e name = r candidateAnchor elementProject and: [ 
						            e isReference not ] ] ].
			r candidate: (r candidateAnchor elementsNameKindPairs
					 inject: artefact
					 into: [ :nav :each | nav find: each second named: each first ]) ] ]
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