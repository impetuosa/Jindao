Class {
	#name : #JinDAMGUIImporter,
	#superclass : #JinGUIFirstCitizenVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#category : #'JinDAM-Importers'
}

{ #category : #'as yet unclassified' }
JinDAMGUIImporter >> createInitializerForFormOrReport: frm with: anObject [

	| initializer source access |
	source := anObject recordSourceFull.
	source ifNotNil: [ 
		initializer := self instantiate: JinDAMInitializeProcess.
		access := self instantiate: JinDAMAccessWrite.

		access
			writeReference: (self
					 instantiateReferenceForNames: { #RecordSource }
					 context: access
					 preferring: { #isAttribute. #isType. #isLet. #isSet });
			isReturn: false.

		source isString
			ifFalse: [ 
				access readReference: (self
						 typeReferenceName: source name
						 typeSymbol: (self currentNamespace findSymbol: source name)
						 context: frm).

				initializer addAccess: access ]
			ifTrue: [ ].

		frm addInvocable: initializer ]
]

{ #category : #initialization }
JinDAMGUIImporter >> setUpObject: aJinDAMObject with: aCollection [

	aCollection do: [ :a | aJinDAMObject propertyEntryFor: a ]
]

{ #category : #'entry-point' }
JinDAMGUIImporter >> visitForm: anObject [

	| frm |
	frm := self instantiate: JinDAMForm.
	frm superClassReference: (self
			 typeReferenceName: 'Form'
			 typeSymbol: (self currentNamespace findSymbol: #Form)
			 context: frm).
	frm name: 'Form_' , anObject name.
	frm anchor: self state top anchor / #forms / anObject name.

	self state top addType: frm.
	self state push: frm.
	frm defaultInstance type: frm.
	self
		setUpObject: frm defaultInstance
		with: anObject documentedProperties.


	super visitForm: anObject.
	anObject ensureUnload.
	self state pop
]

{ #category : #'entry-point' }
JinDAMGUIImporter >> visitReport: anObject [

	| rpt |
	rpt := self instantiate: JinDAMReport.
	rpt superClassReference: (self
			 typeReferenceName: 'Report'
			 typeSymbol: (self currentNamespace findSymbol: #Report)
			 context: rpt).

	rpt name: 'Report_' , anObject name.
	rpt anchor: self state top anchor / #reports / anObject name.

	self state top addType: rpt.
	self state push: rpt.
	rpt defaultInstance type: rpt.
	self
		setUpObject: rpt defaultInstance
		with: anObject documentedProperties  .
	super visitReport: anObject.

	anObject ensureUnload.
	self state pop
]
