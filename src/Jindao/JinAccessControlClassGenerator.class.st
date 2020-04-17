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
	(project forms
		flatCollect: [ :c | 
			c controls
				factory:
					(JinControlGeneratorFactory new
						builder: JinControlDoubleClassBuilder;
						yourself);
				yourself ]) collect: [ :c | c yourself ]
]

{ #category : #tests }
JinAccessControlClassGenerator >> forceGenerationOfAllClasses [
	(project forms flatCollect: [ : c | c controls factory: JinControlGeneratorFactory new ; yourself ]) collect: [  : c | c yourself ].
]

{ #category : #tests }
JinAccessControlClassGenerator >> tearDown [
	super tearDown.
	"self ensureGeneratedClassesAreGone"
]

{ #category : #tests }
JinAccessControlClassGenerator >> testAllTheExpectedControlsAreCreated [
	self forceDoubleGenerationOfAllClasses.
	JinControl allSubclasses
		remove: JinControlGeneric;
		yourself
]
