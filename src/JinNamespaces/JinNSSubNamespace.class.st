Class {
	#name : #JinNSSubNamespace,
	#superclass : #JinNSNamespace,
	#instVars : [
		'owner',
		'path'
	],
	#category : #JinNamespaces
}

{ #category : #accessing }
JinNSSubNamespace >> acceptVisitor: aJinNSVisitorCounter [

	aJinNSVisitorCounter visitSubNamespace: self
]

{ #category : #description }
JinNSSubNamespace >> anchor [

	^ ((parent isNil or: [ tag isAssembly ])
		   ifTrue: [ (JinAnchor on: #/)  / name ]
		   ifFalse: [ parent anchor / self kind / name ]) 
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
