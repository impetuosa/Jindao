Class {
	#name : #JinNSSymbolTable,
	#superclass : #Object,
	#instVars : [
		'external',
		'assembly'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #private }
JinNSSymbolTable class >> loadFrom: aString [

	| instance |
	instance := STON fromStream: aString asFileReference readStream.
	self assert: (instance isKindOf: self).

	^ instance
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
