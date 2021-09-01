Class {
	#name : #JinDAMForm,
	#superclass : #JinDAMClass,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMForm >> accept: aVisitor [  
	^ aVisitor visitForm: self.

]

{ #category : #accessing }
JinDAMForm >> isFormOrReport [

	^ true
]

{ #category : #accessing }
JinDAMForm >> relatedSymbolKind [

	^ JinNSKind form
]
