Class {
	#name : #TestLoadPartialWithAutomaticDependencies,
	#superclass : #TestJinDAMImport,
	#instVars : [
		'usedSymbols',
		'requiredSymbols',
		'isLoadingReferences'
	],
	#category : #'JinDAM-Tests'
}

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
					(a name includesSubstring: 'ActeNaissance' caseSensitive: false) 
						or: [ self isLoadingReferences and: [ self isRequired: a ] ] ]
				ifFalse: [ 
					(a isAccessProject or: [ a isLibrary ]) and: [ 
							self shouldLoadDependency: a ] ] ].
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

	self assert: model accessModules size equals: 1.
	self assert: model accessModules first name equals: #magact.

	self assert: model accessLibraries size equals: 1.
	self assert: model accessLibraries first name equals: #VBALang.

	self assert: model userTypes size equals: 3.
	self assert:
		(model userTypes anySatisfy: [ :a | a name = #Form_Fact ]).
	self assert:
		(model userTypes anySatisfy: [ :a | a name = #mActeNaissance ]).
	self assert: (model userTypes anySatisfy: [ :a | a name = #Debug ])
]

{ #category : #accessing }
TestLoadPartialWithAutomaticDependencies >> usedSymbols [

	^ usedSymbols ifNil: [ usedSymbols := importer usedSymbols copy ]
]
