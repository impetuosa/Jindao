"
Subnamespaces are symbols (named entries) which contain other entries within. 
As a defined a named context (with the name of the class) and contains all the entries within representing other names (attributes, functions, etc).

"
Class {
	#name : #JinNSSubNamespace,
	#superclass : #JinNSNamespace,
	#instVars : [
		'owner',
		'path'
	],
	#category : #'JinNamespaces-Model'
}

{ #category : #accessing }
JinNSSubNamespace >> acceptVisitor: aJinNSVisitorCounter [

	aJinNSVisitorCounter visitSubNamespace: self
]

{ #category : #description }
JinNSSubNamespace >> anchor [

	<doc:
	'Returns an Anchor. An anchor is the path to take to find a specific symbol from the root namespace .'>
	^ (parent isNil or: [ tag isAssembly ])
		  ifTrue: [ (JinAnchor on: #/) / name ]
		  ifFalse: [ parent anchor / self kind / name ]
]

{ #category : #accessing }
JinNSSubNamespace >> assembly [
	^ tag isAssembly ifTrue: [ self ] ifFalse: [ parent assembly ]
]

{ #category : #testing }
JinNSSubNamespace >> canBeFoundedInJinDAM: aJinDAMModel [

	| artefact anchor candidate |
	anchor := self anchor.
	artefact := aJinDAMModel accessModulesAndLibraries
		            detect: [ :e | 
		            e name asLowercase = anchor elementProject asLowercase ]
		            ifNone: [ ^ false ].

	candidate := anchor elementsNameKindPairs
		             inject: artefact
		             into: [ :nav :each | 
			             [ nav find: each second named: each first ]
				             on: NotFound
				             do: [ ^ false ] ].
	^ true
]

{ #category : #'as yet unclassified' }
JinNSSubNamespace >> containingSymbols [

	<doc:
	'Return all the entries where this element has been declared, starting by the inner-most element. Function, Module, Library, Project '>
	^ { self } , parent containingSymbols
]

{ #category : #description }
JinNSSubNamespace >> kind [
 	^ tag
]

{ #category : #accessing }
JinNSSubNamespace >> kind: aJinNSKind [ 
	tag := aJinNSKind
]

{ #category : #accessing }
JinNSSubNamespace >> owner [
	^ owner
]

{ #category : #accessing }
JinNSSubNamespace >> owner: aJinNSEntryOwner [ 
	owner := aJinNSEntryOwner.
]

{ #category : #'as yet unclassified' }
JinNSSubNamespace >> parentChain [

	^ { self } ,( self kind isAssembly
		  ifTrue: [ {  } ]
		  ifFalse: [ parent parentChain ])
]

{ #category : #accessing }
JinNSSubNamespace >> path [
	^ path
]

{ #category : #accessing }
JinNSSubNamespace >> path: aPath [
	path := aPath 
]

{ #category : #accessing }
JinNSSubNamespace >> printOn: aStream [

	aStream
		nextPutAll: name;
		nextPutAll: ':'.
	tag printOn: aStream.
	aStream nextPutAll: '::'.
	owner printOn: aStream.
	aStream
		nextPutAll: '(#';
		nextPutAll:
			(entries ifNil: [ 0 ] ifNotNil: [ entries size ]) asString;
		nextPutAll: ')'
]

{ #category : #'as yet unclassified' }
JinNSSubNamespace >> referersTo: aString [

	| lca lcb |
	lca := ((name copyReplaceAll: '_' with: '')
		        copyReplaceAll: '$'
		        with: '') asLowercase.

	lcb := ((aString copyReplaceAll: '_' with: '')
		        copyReplaceAll: '$'
		        with: '') asLowercase.
	^ lca = lcb
]
