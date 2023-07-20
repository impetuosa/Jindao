Class {
	#name : #JinNSSymbolTable,
	#superclass : #Object,
	#instVars : [
		'external',
		'assembly',
		'allSymbols'
	],
	#category : #JinNamespaces
}

{ #category : #private }
JinNSSymbolTable class >> loadFrom: aString [

	| instance |
	instance := STON fromStream: aString asFileReference readStream.
	self assert: (instance isKindOf: self).

	^ instance
]

{ #category : #accessing }
JinNSSymbolTable >> allSymbols [

	^ allSymbols ifNil: [ 
		  allSymbols := (external flatCollect: #allSymbols) , assembly 
			                flatCollect: #allSymbols ]
]

{ #category : #accessing }
JinNSSymbolTable >> assembly [
	^ assembly 
]

{ #category : #accessing }
JinNSSymbolTable >> assembly: aCollection [ 
	assembly := aCollection
]

{ #category : #accessing }
JinNSSymbolTable >> external [
	^ external
]

{ #category : #accessing }
JinNSSymbolTable >> external: aCollection [ 
	external := aCollection
]

{ #category : #'as yet unclassified' }
JinNSSymbolTable >> namespaceFor: aJinDAMAccessModule kind: aJinNSKind [

	self assert: external size = 1.
	^ external first namespaceFor: aJinDAMAccessModule name  kind: aJinNSKind
]

{ #category : #saving }
JinNSSymbolTable >> saveAs: aString [

	| stream |
	aString asFileReference ensureDelete.
	stream := aString asFileReference writeStream.

	STON put: self onStream: stream.
	stream
		flush;
		close
]
