"
I am a Symbol Table.
I am built based on a specific Microsoft Access project. 
I may contain information of other Microsoft Projects if my original project uses other Microsoft Access projects as dependency. 

I have two main instance variables: 
**external** holds a namespace which aggregates all the symbols declared within my main project.
**assembly** holds namespaces per each associated (referenced) artifact: libraries or other Access projects. 


The external namespace is named external as it holds not only the subhierarchies of symbols but also **all** publically visible elements (or the external visibility of the project). 



"
Class {
	#name : #JinNSSymbolTable,
	#superclass : #Object,
	#instVars : [
		'external',
		'assembly',
		'allSymbols'
	],
	#category : #'JinNamespaces-EntryPoint'
}

{ #category : #private }
JinNSSymbolTable class >> loadFrom: aString [

	<doc:
	'Imports a symbol table in ston format. Receives a file path as parameter (String | FileReference)'>
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
	<doc:'Obtains a namespace for a given name'>
	self assert: external size = 1.
	^ external first namespaceFor: aJinDAMAccessModule name  kind: aJinNSKind
]

{ #category : #saving }
JinNSSymbolTable >> saveAs: aString [

	<doc:
	'Exports a symbol table in ston format. Receives a file path as parameter (String | FileReference)'>
	| stream |
	aString asFileReference ensureDelete.
	stream := aString asFileReference writeStream.

	STON put: self onStream: stream.
	stream
		flush;
		close
]
