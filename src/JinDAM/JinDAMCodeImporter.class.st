Class {
	#name : #JinDAMCodeImporter,
	#superclass : #JinCodeFirstCitizenVisitor,
	#category : #'JinDAM-Importers'
}

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
