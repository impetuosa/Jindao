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
JinCasinoVisitor >> bindDataReadAccess: aJinForm [
	| dataEntity |
	aJinForm recordSource
		ifNotNil: [ :entity | 
			dataEntity := self importDataEntity: entity.
			dataEntity read allowEdits: aJinForm allowEdits.
			dataEntity read allowDeletions: aJinForm allowDeletions.
			dataEntity read allowAdditions: aJinForm allowAdditions.
			dataEntity read allowFilters: aJinForm allowFilters.
			stack top dataBinding: dataEntity read.
			dataEntity read addReader: stack top ]
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
JinCasinoVisitor >> importDataEntity: aJinDataEntity [
	^ aJinDataEntity acceptVisitor: self 
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
	| casinoModel parent parentModel context |
	parent := aControl parentObject.
	context := parent isAccessForm
		ifTrue: [ stack top ]
		ifFalse: [ self nearestContainerTo: parent ].
	context isContainer
		ifFalse: [ context := stack top ].
	casinoModel := self factory
		importControl: aControl
		inTheContextOf: context.
	importedProject map: aControl to: casinoModel.
	^ casinoModel
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importProject: aProject [
	^ self factory importProject: aProject model: importingIntoThisModel . 
	
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importTable: aTable [
	^ self factory
		importTableEntity: aTable
		inTheContextOf: importingIntoThisModel
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
JinCasinoVisitor >> nearestContainerTo: parent [
	| context |
	parent isAccessForm
		ifTrue: [ ^ stack top ].
	context := importedProject
		mappedModelFor: parent
		ifNone: [ self importFormControl: parent ].
	^ context isContainer
		ifTrue: [ context ]
		ifFalse: [ self nearestContainerTo: parent parentObject ]
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
JinCasinoVisitor >> visitControlSource: aSource [
	(stack second dataBinding isNotNil and: [ aSource value isNotEmpty ])
		ifTrue:
			[ stack top dataBinding: (stack second dataBinding readsColumn: aSource value) ]
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
		during: [ self bindDataReadAccess: aJinForm.
			super visitForm: aJinForm.
			aJinForm ensureUnload ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitFormControl: aJinFormControl [
	^ self
		pushInStack: (self importFormControl: aJinFormControl)
		during: [ stack top
				ifNotNil: [ self visitCollection: aJinFormControl properties ] ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitIndex: aJinIndexBody [
	| index |
	index := MDIndex new.
	index
		elements:
			(aJinIndexBody fields
				collect: [ :d | stack top elements detect: [ :f | f name = d name ] ]).
	aJinIndexBody unique
		ifTrue: [ index kind: #Unique ].
	aJinIndexBody primaryKey
		ifTrue: [ index kind: #PrimaryKey ].
	aJinIndexBody foreign
		ifTrue: [ index kind: #ForeignKey.
 ].
	stack top addIndex: index
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
JinCasinoVisitor >> visitQuery: aQuery [
	| importedQuery |
	importedQuery := self factory
		importQueryEntity: aQuery
		inTheContextOf: importingIntoThisModel.
	aQuery ensureUnload.
	^ importedQuery
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitSubForm: aJinControlSubForm [
	^ self factory importSubform: aJinControlSubForm inTheContextOf: stack top
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitTable: aTable [
	^ self
		pushInStack: (self importTable: aTable)
		during: [ super visitTable: aTable.
			aTable ensureUnload ]
]
