Class {
	#name : #TestLoadFormFactPurgeColl,
	#superclass : #TestJinDAMImport,
	#category : #'JinDAM-Tests'
}

{ #category : #initialization }
TestLoadFormFactPurgeColl >> setUp [

	super setUp.
	importer provider
		importGUIElements;
		importGUIControlElementsNoObjectProperties;
		importProjectElementsThat: [ :a | 
			a isAccessForm and: [ a name = #FactPurgeColl ] ].
	self import
]

{ #category : #initialization }
TestLoadFormFactPurgeColl >> testCodeDbApplicationAndOthersWellParsed [

	| acte mouseUp condition execute |
	acte := model userTypes detect: [ :a | a name = #Form_FactPurgeColl ].
	mouseUp := acte invocables detect: [ :a | a selector = #BTOk_MouseUp ].
	condition := (mouseUp block statements at: 9) condition left
		             readReference arguments first expression readReference.
	self assert: condition name equals: #CodeDb.
	execute := ((mouseUp block statements at: 9) ifFalse statements first
		            ifTrue statements at: 10) readReference.

	self assert: execute context readReference name equals: #CodeDb.
	self assert: execute name equals: #Execute.
	self assert: execute arguments size equals: 2
]

{ #category : #initialization }
TestLoadFormFactPurgeColl >> testModelShouldOnlyContainAModuleALibraryAndAUserType [

	self assert: model accessModules size equals: 1.
	self assert: model accessModules first name equals: #magact.

	self assert: model accessLibraries size equals: 1.
	self assert: model accessLibraries first name equals: #VBALang.

	self assert: model userTypes size equals: 2.
	self assert:
		(model userTypes anySatisfy: [ :a | a name = #Form_FactPurgeColl ]).
	self assert: (model userTypes anySatisfy: [ :a | a name = #Debug ])
]
