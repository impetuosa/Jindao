Class {
	#name : #JinDAMExternalSubProcedure,
	#superclass : #JinDAMInvocable,
	#instVars : [
		'library'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMExternalSubProcedure >> relatedSymbolKind [

	^ JinNSKind externalSub
]
