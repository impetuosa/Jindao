Class {
	#name : #JinSingleFormVisitor,
	#superclass : #JinCasinoVisitor,
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
JinSingleFormVisitor >> visitProject: aJinAccessProject [
	^ importedProject := self
		pushInStack: (self importProject: aJinAccessProject)
		during: [ self
				visitCollection:
					(aJinAccessProject forms
						select: [ :f | f name = 'Employee Orders Subform' ]) ]
]
