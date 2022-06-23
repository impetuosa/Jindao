Class {
	#name : #JinDAMImporter,
	#superclass : #Object,
	#instVars : [
		'provider',
		'symbolTable',
		'importer',
		'problematicRefs',
		'artefacts',
		'traversed'
	],
	#classInstVars : [
		'egrc'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #accessing }
JinDAMImporter class >> egrc [
	^ egrc
]

{ #category : #accessing }
JinDAMImporter class >> egrc: aJinDAMModel [

	egrc := aJinDAMModel
]

{ #category : #accessing }
JinDAMImporter class >> importerForAlcix [

	| importer |
	importer := JinDAMImporter new.
	importer provider
		importAccessReferences;
		importDatabase;
		importProjectElements;
		importGUIElements;
		importGUIControlElementsNoObjectProperties;
		importCodeElements;
		importSyntacticElements;
		importLibraryReferences.
	^ importer
]

{ #category : #accessing }
JinDAMImporter class >> importerForMoxing [

	| importer |
	importer := JinDAMImporter new.
	importer provider
		importAccessReferences;
		importDatabase;
		importProjectElements;
		importGUIElements;
		importGUIControlElements;
		importCodeElements;
		importAllSyntacticElements;
		importLibraryReferences.
	^ importer
]

{ #category : #accessing }
JinDAMImporter >> artefacts [

	^ artefacts
]

{ #category : #accessing }
JinDAMImporter >> createDefaultVisitor [
	^ importer := provider build
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
JinDAMImporter >> importer [
	^ importer
]

{ #category : #accessing }
JinDAMImporter >> initialize [
	super initialize.
	provider := JinDAMImportingVisitorProvider new 
]

{ #category : #accessing }
JinDAMImporter >> link: aJinDAMModel [

	| references |
	problematicRefs := nil.
	references := aJinDAMModel references.
	artefacts := aJinDAMModel entities select: [ :e | 
		             e isKindOf: JinDAMArtefact ].

	traversed := Set new.
	references
		select: [ :r | r isKindOf: JinDAMTypeReference ]
		thenDo: [ :r | self linkReference: r in: aJinDAMModel ].
	references
		reject: [ :r | r isKindOf: JinDAMTypeReference ]
		thenDo: [ :r | self linkReference: r in: aJinDAMModel ]
]

{ #category : #accessing }
JinDAMImporter >> linkReference: r in: aJinDAMModel [

	(traversed includes: r) ifTrue: [ ^ self ].

	traversed add: r.
	[ 
	r candidate ifNil: [ 
		r context isReference ifTrue: [ 
			self linkReference: r context in: aJinDAMModel ].
		r candidateAnchor
			ifNil: [ self manageNameLookUpReference: r in: aJinDAMModel ]
			ifNotNil: [ self manageAnchorLookInReference: r in: aJinDAMModel ] ] ]
		on: Error
		do: [ :e | 
			self problematicRefs add: { 
					r.
					e } ]
]

{ #category : #accessing }
JinDAMImporter >> manageAnchorLookInReference: r in: aJinDAMModel [

	| artefact candidate candidates |
	"	aJinDAMModel entities select: [ :a | 
		(a isInvocable ) and: [ a name = r name ] ]."
	r context isReference ifTrue: [ 
		^ self manageNameLookUpReference: r in: aJinDAMModel ].

	(r context isReadAccess and: [ 
		 r context readReference ~= r and: [ 
			 r context readReference context ~= r ] ]) ifTrue: [ 
		^ self manageNameLookUpWithnReadAccessReference: r in: aJinDAMModel ].
	artefact := artefacts detect: [ :e | 
		            e name asLowercase
		            = r candidateAnchor elementProject asLowercase ].
	candidate := r candidateAnchor elementsNameKindPairs
		             inject: artefact
		             into: [ :nav :each | 
		             nav find: each second named: each first ].
	(r respondsTo: #arguments) ifTrue: [ 
		candidate isInvocable
			ifFalse: [ r candidate: candidate ]
			ifTrue: [ 
				self assert: (candidate respondsTo: #parameters).
				(r arguments size
					 between:
					 (candidate parameters reject: [ :p | p isOptional ]) size
					 and: candidate parameters size)
					ifTrue: [ r candidate: candidate ]
					ifFalse: [ 
						(r arguments isEmpty and: [ candidate species = JinDAMFunction ])
							ifTrue: [ r candidate: candidate ]
							ifFalse: [ 
								candidates := aJinDAMModel entities select: [ :a | 
									              a isInvocable and: [ 
										              a name = r name and: [ 
											              r arguments size
												              between:
												              (a parameters reject: [ :p | p isOptional ])
													              size
												              and: a parameters size ] ] ].
								candidates size = 1
									ifTrue: [ r candidate: candidates first ]
									ifFalse: [ r candidate: candidate ] ] ] ] ]
]

{ #category : #accessing }
JinDAMImporter >> manageNameLookUpReference: r in: aJinDAMModel [

	| candidates |
	({ 'NULL'. 'ERROR'. 'CARRAY'. 'SAFEARRAY'. 'ParamArray'. 'HRESULT'.
	 'COMUnknownInstance'. 'COMDispatchInstance'. 'USERDEFINED*' } 
		 includes: r name) ifTrue: [ ^ self ].
	r context isReadAccess ifTrue: [ ^ self ].
	self assert: r context isReference.
	r context candidate ifNil: [ 
		self linkReference: r context in: aJinDAMModel ].

	candidates := r context candidateType
		              findAttributeInvocable: r name
		              amountArguments: r arguments size.
	candidates
		select: [ :a | a isAlias ]
		thenDo: [ :a | self linkReference: a typeReference in: aJinDAMModel ].
		
	candidates
		ifEmpty: [ self assert: r isDictionaryAccess ]
		ifNotEmpty: [ 
			self assert: (candidates size = 1 or: [ 
					 (candidates collect: [ :c | c typeReference name ]) asSet size
					 = 1 and: [ 
						 (candidates collect: [ :c | c parametersSize ]) asSet size = 1 ] ]).
			candidates size = 1
				ifTrue: [ 
					r candidateAnchor: candidates first anchor.
					r candidate: candidates first ]
				ifFalse: [ r candidate: candidates ] ]
]

{ #category : #accessing }
JinDAMImporter >> manageNameLookUpWithnReadAccessReference: r in: aJinDAMModel [

	| candidates ref |
	({ 'NULL'. 'ERROR'. 'CARRAY'. 'SAFEARRAY'. 'ParamArray'. 'HRESULT'.
	 'COMUnknownInstance'. 'COMDispatchInstance'. 'USERDEFINED*' } 
		 includes: r name) ifTrue: [ ^ self ].

	self assert: r context isReadAccess.
	ref := r context readReference.
	ref candidate ifNil: [ self linkReference: ref in: aJinDAMModel ].

	candidates := ref candidateType
		              findAttributeInvocable: r name
		              amountArguments: r arguments size.

	candidates
		ifEmpty: [ self assert: r isDictionaryAccess ]
		ifNotEmpty: [ 
			self assert: (candidates size = 1 or: [ 
					 (candidates collect: [ :c | c typeReference name ]) asSet size
					 = 1 and: [ 
						 (candidates collect: [ :c | c parametersSize ]) asSet size = 1 ] ]).
			candidates size = 1
				ifTrue: [ 
					r candidateAnchor: candidates first anchor.
					r candidate: candidates first ]
				ifFalse: [ r candidate: candidates ] ]
]

{ #category : #accessing }
JinDAMImporter >> model [
	^ importer model 
]

{ #category : #'as yet unclassified' }
JinDAMImporter >> problematicRefs [

^	problematicRefs ifNil: [ problematicRefs  := OrderedCollection new  ]
]

{ #category : #accessing }
JinDAMImporter >> provider [
	^ provider
]

{ #category : #accessing }
JinDAMImporter >> state [

	^ importer state
]

{ #category : #accessing }
JinDAMImporter >> usedSymbols [

	^ importer usedSymbols
]

{ #category : #accessing }
JinDAMImporter >> visitorFor: aModel [

	^ self createDefaultVisitor
		  model: aModel;
		  symbolTable: symbolTable;
		  yourself
]
