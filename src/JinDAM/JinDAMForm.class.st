Class {
	#name : #JinDAMForm,
	#superclass : #JinDAMUIClass,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMForm >> accept: aVisitor [  
	^ aVisitor visitForm: self.

]

{ #category : #accessing }
JinDAMForm >> relatedSymbolKind [

	^ JinNSKind form
]
