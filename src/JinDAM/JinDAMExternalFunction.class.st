Class {
	#name : #JinDAMExternalFunction,
	#superclass : #JinDAMInvocable,
	#instVars : [
		'library',
		'type'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMExternalFunction >> relatedSymbolKind [

	^ JinNSKind externalFunction
]
