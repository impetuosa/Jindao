Class {
	#name : #JinCodeFirstCitizenVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Subvisitor'
}

{ #category : #'as yet unclassified' }
JinCodeFirstCitizenVisitor >> code [
	^ self
]

{ #category : #'as yet unclassified' }
JinCodeFirstCitizenVisitor >> visitFormModule: aJinFormModule [
	self visitModule: aJinFormModule
]

{ #category : #'as yet unclassified' }
JinCodeFirstCitizenVisitor >> visitMacro: aMacro [
]

{ #category : #'as yet unclassified' }
JinCodeFirstCitizenVisitor >> visitModule: aJinModule [

	({ 'CBeanOEC'. 'CBeanDeclarants'. 'FactLieuCelebMariageUsuelFiche'.
	 'Form_FactLieuCelebMariageUsuelFiche'.
	 'FactLieuDecesUsuelFiche'. 'Form_FactLieuDecesUsuelFiche'.
	 'FactLieuTribunalFiche'. 'Form_FactLieuTribunalFiche'.
	 'FactLieuAccouchementUsuelFiche'. 'Form_FactLieuAccouchementUsuelFiche' } 
		 includes: aJinModule name) ifTrue: [ 
		^ self state top astCannotLoad ].
	aJinModule code acceptVisitor: self
]
