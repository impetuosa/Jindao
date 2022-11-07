Class {
	#name : #TestLoadAndLinkModuleActeNaissance,
	#superclass : #TestJinDAMImport,
	#category : #'JinDAM-Tests'
}

{ #category : #initialization }
TestLoadAndLinkModuleActeNaissance >> setUp [

	super setUp.
	"Loads the mActeNaissance module The Fact Form and all the inside elements."
	importer provider
		importGUIElements;
		importGUIControlElementsNoObjectProperties;
		importLibraryReferences;
		importProjectElementsThat: [ :a | 
			a isModule
				ifTrue: [ a name = #mActeNaissance ]
				ifFalse: [ 
					a isAccessForm
						ifTrue: [ a name = #Fact ]
						ifFalse: [ 
							a isTable not and: [ 
									a isQuery not and: [ 
											a isAccessProject not and: [ a isLibrary ] ] ] ] ] ].
	self import.
	self link
]

{ #category : #initialization }
TestLoadAndLinkModuleActeNaissance >> testEnregistreEnteteActeNaissanceMustUseFormControls [

	| acte iif formCandidate1 formCandidate2 enregistreEnteteActeNaissance setNew |
	acte := model userTypes detect: [ :a | a name = #mActeNaissance ].
	enregistreEnteteActeNaissance := acte invocables detect: [ :a | 
		                                 a selector
		                                 = #pgEnregistreEnteteActeNaissance ].

	setNew := enregistreEnteteActeNaissance block statements at: 5.
	self
		assert: setNew assignedTo readReference candidate species
		equals: JinDAMLocalVariable.
	self
		assert:
			setNew assignedTo readReference candidate typeReference candidate
				species
		equals: JinDAMAlias.
	self
		assert:
			setNew assignedTo readReference candidate typeReference candidate
				typeReference candidate name
		equals: '_Recordset'.
	self
		assert: setNew valueToAssign readReference typeReference candidate
		equals:
		setNew assignedTo readReference candidate typeReference candidate.

	iif := (enregistreEnteteActeNaissance block statements at: 8)
		       valueToAssign readReference.
	self assert: iif candidate isInvocable.
	self assert: iif selector equals: iif candidate selector.

	formCandidate1 := iif arguments first expression readReference
		                  arguments first expression readReference context
		                  candidate.
	formCandidate2 := iif arguments third expression readReference
		                  context candidate.
	self assert: formCandidate1 equals: formCandidate2
]

{ #category : #initialization }
TestLoadAndLinkModuleActeNaissance >> testModelShouldOnlyContainAModuleALibraryAndAUserType [

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
