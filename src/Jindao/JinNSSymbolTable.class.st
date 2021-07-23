Class {
	#name : #JinNSSymbolTable,
	#superclass : #Object,
	#instVars : [
		'external',
		'assembly'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #accessing }
JinNSSymbolTable >> assembly: aCollection [ 
	assembly := aCollection
]

{ #category : #accessing }
JinNSSymbolTable >> external: aCollection [ 
	external := aCollection
]
