Class {
	#name : #JinDAMReport,
	#superclass : #JinDAMClass,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMReport >> accept: aVisitor [  
	^ aVisitor visitReport: self.

]

{ #category : #'as yet unclassified' }
JinDAMReport >> isFormOrReport [

	^ true
]

{ #category : #'as yet unclassified' }
JinDAMReport >> relatedSymbolKind [

	^ JinNSKind report 
]
