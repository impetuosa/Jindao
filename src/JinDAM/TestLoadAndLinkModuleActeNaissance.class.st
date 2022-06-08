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

	| acte iif formControls1 formControls2 enregistreEnteteActeNaissance setNew |
	acte := model userTypes detect: [ :a | a name = #mActeNaissance ].
	enregistreEnteteActeNaissance := acte invocables detect: [ :a | 
		                                 a selector
		                                 = #pgEnregistreEnteteActeNaissance ].
	self halt.	
	setNew := enregistreEnteteActeNaissance block statements at: 5.
	
	iif := (enregistreEnteteActeNaissance block statements at: 8)
		       valueToAssign readReference.
	
	self assert: iif selector equals: #IIf.
	self assert: iif arguments size equals: 3.
	formControls1 := iif arguments first expression readReference
		                 arguments first expression readReference.
	formControls2 := iif arguments third expression readReference.
	self assert: formControls1 name equals: #Controls.
	self assert: formControls2 name equals: #Controls.
	self assert: formControls1 arguments size equals: 1.
	self assert: formControls2 arguments size equals: 1.
	self
		assert:
		formControls1 arguments first expression readReference candidate
		equals: '"IdEnteteActe"'.
	self
		assert:
		formControls2 arguments first expression readReference candidate
		equals: '"IdEnteteActe"'.
	self assert: formControls1 context readReference name equals: #Forms.
	self assert: formControls2 context readReference name equals: #Forms.
	self
		assert: formControls1 context readReference arguments size
		equals: 1.
	self
		assert: formControls2 context readReference arguments size
		equals: 1.

	self
		assert:
			formControls1 context readReference arguments first expression
				readReference candidate
		equals: '"Fact"'.
	self
		assert:
			formControls2 context readReference arguments first expression
				readReference candidate
		equals: '"Fact"'
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
