Class {
	#name : #JinCasinoVisitor,
	#superclass : #JinVisitor,
	#instVars : [
		'stack',
		'importedProject',
		'mapper',
		'factory',
		'importingIntoThisModel',
		'errors'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
JinCasinoVisitor class >> defaultNew [ 
	^ self new
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> errors [
	^ errors
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> factory [
	^ factory ifNil: [ JinCasinoUIModelStatelessFactory new ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importAccessProperty: aProperty [

	| casinoModel |
	casinoModel := self factory
		               importAccessProperty: aProperty
		               inTheContextOf: stack top.
	importedProject map: aProperty to: casinoModel.
	^ casinoModel
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importForm: aForm [

	| casinoModel |
	casinoModel := self factory
		               importForm: aForm
		               inTheContextOf: stack top.
	importedProject map: aForm to: casinoModel.
	^ casinoModel
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importFormControl: aControl [

	| casinoModel |
	casinoModel := self factory
		               importControl: aControl
		               inTheContextOf: stack top.
	importedProject map: aControl to: casinoModel.
	^ casinoModel
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importProject: aProject [
	^ self factory importProject: aProject model: importingIntoThisModel . 
	
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importedProject [
	^ importedProject
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> initialize [
	super initialize.
	stack := Stack new.
	errors := Dictionary  new.
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> installPartialProject [

	importedProject := JinCasinoProject new.
	importedProject model: importingIntoThisModel.
	stack push: importedProject.
	^ importedProject
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> pushInStack: anObject during: aBlock [
	stack push: anObject.
	aBlock
		ensure: [ ^ stack pop ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> useModel: aModel [
	importingIntoThisModel := aModel
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitAccessProperty: aJinAccessProperty [
	^ self importAccessProperty: aJinAccessProperty
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitCustomControl: aJinControlGeneric [ 
	^ self
		pushInStack: (self importFormControl: aJinControlGeneric)
		during: [ stack top ifNotNil: [self visitCollection: aJinControlGeneric properties ]]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitForm: aJinForm [
	^ self
		pushInStack: (self importForm: aJinForm)
		during: [ super visitForm: aJinForm.
			aJinForm ensureUnload ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitFormControl: aJinFormControl [
	^ self
		pushInStack: (self importFormControl: aJinFormControl)
		during: [ stack top ifNotNil: [self visitCollection: aJinFormControl properties ]]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitProject: aJinAccessProject [
	^ importedProject := self
		pushInStack: (self importProject: aJinAccessProject)
		during: [ 
"			self visitCollection: aJinAccessProject references."
			self visitCollection: (aJinAccessProject forms).
"			self visitCollection: aJinAccessProject queries.
			self visitCollection: aJinAccessProject reports.
			self visitCollection: aJinAccessProject tables "]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitSubForm: aJinControlSubForm [
	^ self factory importSubform: aJinControlSubForm inTheContextOf: stack top
]
