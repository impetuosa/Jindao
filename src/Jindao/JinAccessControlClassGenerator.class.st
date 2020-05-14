Class {
	#name : #JinAccessControlClassGenerator,
	#superclass : #JinNorwindBasedTests,
	#category : #'Jindao-Tests'
}

{ #category : #tests }
JinAccessControlClassGenerator >> ensureGeneratedClassesAreGone [
	(RPackageOrganizer default packages
		detect: [ :a | a name = 'Jindao' ]) classTags
		detect: [ :t | t name = 'DomainObjects-GeneratedControls' ]
		ifFound: [ :p | p classes do: [ :ckass | ckass removeFromSystem ] ]
]

{ #category : #tests }
JinAccessControlClassGenerator >> forceDoubleGenerationOfAllClasses [
	^ (project forms
		flatCollect: [ :c | 
			c controls
				factory: JinRemoteObjectGeneratorFactory newControlDoubleClassBasedFactory;
				yourself ]) collect: [ :c | c yourself ]
]

{ #category : #tests }
JinAccessControlClassGenerator >> forceGenerationOfAllAccessPropertiesClasses [
	| allControls |
	allControls := self forceGenerationOfAllClasses.
	(allControls
		flatCollect: [ :c | 
			c properties
				factory: JinRemoteObjectGeneratorFactory newAccessPropertySimpleClassBasedFactory;
				yourself ]) collect: [ :p | p yourself ]
]

{ #category : #tests }
JinAccessControlClassGenerator >> forceGenerationOfAllClasses [
	^ (project forms
		flatCollect: [ :c | 
			c controls
				factory: JinRemoteObjectGeneratorFactory newControlSimpleClassBasedFactory ])
		collect: [ :c | c yourself ]
]

{ #category : #tests }
JinAccessControlClassGenerator >> tearDown [
	super tearDown.
	"self ensureGeneratedClassesAreGone"
]

{ #category : #tests }
JinAccessControlClassGenerator >> testAllTheExpectedAccessPropertyTypesAreCreated [
	self forceGenerationOfAllAccessPropertiesClasses.
	JinControl allSubclasses
		remove: JinControlGeneric;
		yourself
]

{ #category : #tests }
JinAccessControlClassGenerator >> testAllTheExpectedControlsAreCreated [
	self forceDoubleGenerationOfAllClasses.
	self
		assert:
			(JinControl allSubclasses
				remove: JinControlGeneric;
				remove: JinControlGenerated;
				yourself) size
		equals: 26
]

{ #category : #tests }
JinAccessControlClassGenerator >> testGeneratedClassesMethodsOrPropertiesShouldNotOverrideAnyNotOverrideMethod [
	| configuredBuilder |
	configuredBuilder := JinRemoteObjectGeneratorFactory
		newControlSimpleClassBasedFactory newBuilderForName: 'Test'.
	self
		deny: (configuredBuilder shouldGenerateMethodNamed: 'properties' asSymbol)
]

{ #category : #tests }
JinAccessControlClassGenerator >> testGeneratedClassesMethodsOrPropertiesShouldNotOverrideAnyNotOverrideMethod2 [
	| configuredBuilder |
	configuredBuilder := JinRemoteObjectGeneratorFactory
		newControlSimpleClassBasedFactory newBuilderForName: 'Test'.
	self
		deny: (configuredBuilder shouldGenerateMethodNamed: 'controlName' asSymbol)
]

{ #category : #tests }
JinAccessControlClassGenerator >> testGeneratedClassesMethodsOrPropertiesShouldOverrideAnyNoNotOverrideMethod [
	| configuredBuilder |
	configuredBuilder := JinRemoteObjectGeneratorFactory
		newControlSimpleClassBasedFactory newBuilderForName: 'Test'.
	self
		assert:
			(configuredBuilder
				shouldGenerateMethodNamed: 'acceptVisitor:' asSymbol)
]
