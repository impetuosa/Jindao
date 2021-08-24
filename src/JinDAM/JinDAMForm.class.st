Class {
	#name : #JinDAMForm,
	#superclass : #JinDAMClass,
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMForm >> isFormOrReport [

	^ true
]

{ #category : #accessing }
JinDAMForm >> relatedSymbolKind [

	^ JinNSKind form
]
