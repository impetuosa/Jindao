Class {
	#name : #JinTypescriptLoader,
	#superclass : #Object,
	#category : #JindaoAngular
}

{ #category : #'as yet unclassified' }
JinTypescriptLoader class >> loadClassFromStream: aStream [

	| loader |
	loader := self new.

	(TypeScriptParser parseStream: aStream) acceptVisitor: loader.
	^ loader result
]
