Class {
	#name : #TestLoadModuleActeNaissance,
	#superclass : #TestJinDAMImport,
	#category : #'JinDAM-Tests'
}

{ #category : #initialization }
TestLoadModuleActeNaissance >> setUp [

	super setUp.
	importer provider importProjectElementsThat: [ :a | 
		a isModule and: [ a name = #mActeNaissance ] ].
	self import
]

{ #category : #initialization }
TestLoadModuleActeNaissance >> testEnregistreEnteteActeNaissanceMustUseFormControls [

	| acte iif formControls1 formControls2 enregistreEnteteActeNaissance setNew |
	acte := model userTypes detect: [ :a | a name = #mActeNaissance ].
	enregistreEnteteActeNaissance := acte invocables detect: [ :a | 
		                                 a selector
		                                 = #pgEnregistreEnteteActeNaissance ].
	
	setNew := enregistreEnteteActeNaissance block statements at: 5.
	self assert: setNew species equals: JinDAMAccessWrite.
	self
		assert: setNew valueToAssign readReference species
		equals: JinDAMNewExpression.
	self
		assert: setNew valueToAssign readReference typeReference species
		equals: JinDAMTypeReference.
	self
		assert: setNew valueToAssign readReference typeReference name
		equals: #Recordset.
	self
		assert:
		setNew valueToAssign readReference typeReference context name
		equals: #ADODB.

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
TestLoadModuleActeNaissance >> testModelShouldOnlyContainAModuleALibraryAndAUserType [

	self assert: model accessModules size equals: 1.
	self assert: model accessModules first name equals: #magact.

	self assert: model accessLibraries size equals: 1.
	self assert: model accessLibraries first name equals: #VBALang.

	self assert: model userTypes size equals: 2.
	self assert:
		(model userTypes anySatisfy: [ :a | a name = #mActeNaissance ]).
	self assert: (model userTypes anySatisfy: [ :a | a name = #Debug ])
]
