Class {
	#name : #TestLoadPartialWithAutomaticDependencies,
	#superclass : #TestJinDAMImport,
	#instVars : [
		'usedSymbols',
		'requiredSymbols',
		'isLoadingReferences',
		'internallyRequiredSymbols'
	],
	#category : #'JinDAM-Tests'
}

{ #category : #'as yet unclassified' }
TestLoadPartialWithAutomaticDependencies >> internallyRequiredSymbols [

	^ internallyRequiredSymbols ifNil: [ 
		  internallyRequiredSymbols := ((importer usedSymbols reject: #isNil) 
			                                select: [ :a | 
				                                a assembly isNotNil and: [ 
					                                a assembly name asLowercase
					                                = #magact ] ]) flatCollect:
			                               #containingSymbols ]
]

{ #category : #initialization }
TestLoadPartialWithAutomaticDependencies >> isLoadingReferences [

	" If the topest loading artefact is a library / access module with a path different to the one of the loading project, then is loading references "

	^ (importer state detect: [ :s | 
		   s isAccessModule or: [ s isLibrary ] ]) path ~= self path
]

{ #category : #initialization }
TestLoadPartialWithAutomaticDependencies >> isRequired: aLibraryElement [
	^ self requiredSymbols anySatisfy: [ :symbol | 
		  aLibraryElement isReferredBySymbol: symbol ]
]

{ #category : #initialization }
TestLoadPartialWithAutomaticDependencies >> isRequiredInternally: aLibraryElement [

	| t |
	t := self internallyRequiredSymbols anySatisfy: [ :symbol | 
		     aLibraryElement isReferredBySymbol: symbol ].
	t ifTrue: [ 
		internallyRequiredSymbols := nil.
		^ true ].
	^ false
]

{ #category : #'as yet unclassified' }
TestLoadPartialWithAutomaticDependencies >> requiredSymbols [

	| usedAnchors symbols |
	^ requiredSymbols ifNil: [ 
		  usedAnchors := importer candidateAnchors.
		  requiredSymbols := (self usedSymbols reject: #isNil) flatCollect:
			                     #containingSymbols.
		 " symbols := (symbolTable allSymbols select: [ :a | 
			              usedAnchors includes: a anchor ]) asSet.
		  requiredSymbols addAll: symbols."
		  requiredSymbols ]
]

{ #category : #initialization }
TestLoadPartialWithAutomaticDependencies >> resetRequiredSymbols [

	requiredSymbols := nil.
	usedSymbols := nil
]

{ #category : #initialization }
TestLoadPartialWithAutomaticDependencies >> setUp [

	super setUp.
	"Loads the mActeNaissance module The Fact Form and all the inside elements."
	importer provider
		importGUIElements;
		importDatabase;
		importGUIControlElements;
		importAccessReferences;
		importLibraryReferencesThat: [ :libraryElement | 
			self isRequired: libraryElement ];
		importProjectElementsThat: [ :a | 
			a isModelObject
				ifTrue: [ 
					(a name includesSubstring: 'Naissance' caseSensitive: true) or: [ 
							self isLoadingReferences and: [ self isRequired: a ] ] ]
				ifFalse: [ 
					(a isAccessProject or: [ a isLibrary ]) and: [ 
							self shouldLoadDependency: a ] ] ]
		loadingInternalDependenciesThat: [ :d | 
			self isRequiredInternally: d ].
	self import.
	self link
]

{ #category : #initialization }
TestLoadPartialWithAutomaticDependencies >> shouldLoadDependency: anArtefact [

	| names |
	names := (self usedSymbols
		          reject: #isNil
		          thenCollect: [ :a | a assembly ])
		         reject: #isNil
		         thenCollect: #name.
	^ ((names collect: #asLowercase) includes:
		   anArtefact name asLowercase)
		  ifTrue: [ 
			  self resetRequiredSymbols.
			  true ]
		  ifFalse: [ false ]
]

{ #category : #initialization }
TestLoadPartialWithAutomaticDependencies >> testModelShouldOnlyContainAModuleALibraryAndAUserType [

	self assert: model accessModules size equals: 6.
	self
		assert: (model accessModules collect: #name) asSet
		equals:
		#( 'magact' 'MAGDEM' 'MAGGPEB' 'CACCUEIL' 'CUTL' 'chabil' ) asSet.

	self assert: model accessLibraries size equals: 7.
	self
		assert: (model accessLibraries collect: #name) asSet
		equals:
			#( 'MSForms' 'WMEBoutons020000' 'ADODB' 'DAO' 'VBA' 'Access'
			   #VBALang ) asSet.

	self assert: (model accessModules first types allSatisfy: [ :t | 
			 t name includesSubstring: #ActeNaissance caseSensitive: false ]).

	self assert: model userTypes size equals: 191.
	JinDAMImporter egrc: model
]

{ #category : #accessing }
TestLoadPartialWithAutomaticDependencies >> usedSymbols [

	^ usedSymbols ifNil: [ usedSymbols := importer usedSymbols copy ]
]
