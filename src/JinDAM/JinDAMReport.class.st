Class {
	#name : #JinDAMReport,
	#superclass : #JinDAMUIClass,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMReport >> accept: aVisitor [  
	^ aVisitor visitReport: self.

]

{ #category : #'as yet unclassified' }
JinDAMReport >> relatedSymbolKind [

	^ JinNSKind report 
]
