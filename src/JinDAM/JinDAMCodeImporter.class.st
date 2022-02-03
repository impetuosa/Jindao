Class {
	#name : #JinDAMCodeImporter,
	#superclass : #JinCodeFirstCitizenVisitor,
	#category : #'JinDAM-Importers'
}

{ #category : #'visit-first-objects' }
JinDAMCodeImporter >> avoidingEntities [

	^{} 
	"|^ { 'CBeanOEC'. 'CBeanDeclarants'. 'FactLieuCelebMariageUsuelFiche'.
	  'Form_FactLieuCelebMariageUsuelFiche'.
	  'FactLieuDecesUsuelFiche'. 'Form_FactLieuDecesUsuelFiche'.
	  'FactLieuTribunalFiche'. 'Form_FactLieuTribunalFiche'.
	  'FactLieuAccouchementUsuelFiche'. 'Form_FactLieuAccouchementUsuelFiche'.
	  'CMVCFicheControler'. 'CMetrologyModel'. 'CPieceJointeModel'.
	  'FNavigateurWeb'. 'Form_CMVCFicheControler'.
	  'Form_CMetrologyModel'. 'Form_CPieceJointeModel'.
	  'Form_FNavigateurWeb' . 'FGedMetadataSF' . 'Form_FGedMetadataSF' .
		'Form_FgpeCollectiviteFiche' . 'FgpeCollectiviteFiche' .
		'Form_CPanelEvenement' . 'CPanelEvenement' . 
				'Form_CPanelIdentite' . 'CPanelIdentite' . 
		'Form_CBeanMention' . 'CBeanMention' .
		'CBeanCommission' . 'Form_CBeanCommission' . 'CDemESV'
	 }|"
]

{ #category : #'visit-first-objects' }
JinDAMCodeImporter >> visitFormModule: anObject [

	super visitModule: anObject
]

{ #category : #'visit-first-objects' }
JinDAMCodeImporter >> visitMacro: aMacro [

]

{ #category : #'visit-first-objects' }
JinDAMCodeImporter >> visitModule: anObject [

	| obj |
	

	obj := anObject isClassModule
		       ifTrue: [ self instantiate: JinDAMClass ]
		       ifFalse: [ self instantiate: JinDAMModule ].
	self state top addType: obj.
	obj name: anObject name.
	obj anchor: self state top anchor / #modules / anObject name.

	self state push: obj.


	super visitModule: anObject.
	anObject ensureUnload.
	self state pop
]
