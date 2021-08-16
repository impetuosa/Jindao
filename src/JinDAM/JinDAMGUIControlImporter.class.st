Class {
	#name : #JinDAMGUIControlImporter,
	#superclass : #JinGUIControlVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#category : #'JinDAM-Importers'
}

{ #category : #'as yet unclassified' }
JinDAMGUIControlImporter >> nodeToTypeReferenceName: aVBNode context: aContext [ 
	^ self referenceNameConverter toTypeReferenceName: aVBNode context: aContext 
]

{ #category : #'entry-point' }
JinDAMGUIControlImporter >> visitFormControl: anObject [

	| attribute |
	attribute := self instantiate: JinDAMAttribute.
	attribute visibility: #Public.
	attribute name: anObject name.
	attribute anchor: self state top anchor / #controls / anObject name.
	attribute typeReference: (self
			 instantiateReferenceForNames: { anObject mappedTypeName }
			 context: attribute
			 preferring: { #isType }).
	self state top addAttribute:  attribute
]
