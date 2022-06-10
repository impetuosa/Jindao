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
			                               #containingSymbols.

		  internallyRequiredSymbols := internallyRequiredSymbols reject: [ 
			                               :symbol | 
			                               symbol canBeFoundedInJinDAM:
				                               importer importer model ] ]
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

	^ self internallyRequiredSymbols anySatisfy: [ :symbol | 
		  aLibraryElement isReferredBySymbol: symbol ]
]

{ #category : #'as yet unclassified' }
TestLoadPartialWithAutomaticDependencies >> requiredSymbols [

		^ requiredSymbols ifNil: [ 
		  self assert: usedSymbols isNotNil.
		  requiredSymbols := (usedSymbols reject: #isNil) flatCollect:
			                     #containingSymbols ]
]

{ #category : #initialization }
TestLoadPartialWithAutomaticDependencies >> setUp [

	super setUp.
	"Loads the mActeNaissance module The Fact Form and all the inside elements."
	importer provider
		importGUIElements;
		importGUIControlElementsNoObjectProperties;
		importAccessReferences;
		importLibraryReferencesThat: [ :libraryElement | 
			self isRequired: libraryElement ];
		importProjectElementsThat: [ :a | 
			a isModelObject
				ifTrue: [ 
					(a name includesSubstring: 'Naissance' caseSensitive: false) or: [ 
							self isLoadingReferences and: [ self isRequired: a ] ] ]
				ifFalse: [ 
					(a isAccessProject or: [ a isLibrary ]) and: [ 
							self shouldLoadDependency: a ] ] ]
		loadingInternalDependenciesThat:[ : d | self isRequiredInternally: d ].
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
	^ (names includes: anArtefact name)
]

{ #category : #initialization }
TestLoadPartialWithAutomaticDependencies >> testModelShouldOnlyContainAModuleALibraryAndAUserType [

	self assert: model accessModules size equals: 5.
	self
		assert: (model accessModules collect: #name) asSet
		equals: #( 'magact' 'MAGDEM' 'MAGGPEB' 'CACCUEIL' 'CUTL' ) asSet.

	self assert: model accessLibraries size equals: 7.
	self
		assert: (model accessLibraries collect: #name) asSet
		equals:
			#( 'MSForms' 'WMEBoutons020000' 'ADODB' 'DAO' 'VBA' 'Access'
			   #VBALang ) asSet.

	self assert: (model accessModules first types allSatisfy: [ :t | 
			 t name includesSubstring: #ActeNaissance caseSensitive: false ]).

	self assert: model userTypes size equals: 83.

]

{ #category : #accessing }
TestLoadPartialWithAutomaticDependencies >> usedSymbols [

	^ usedSymbols ifNil: [ usedSymbols := importer usedSymbols copy ]
]
