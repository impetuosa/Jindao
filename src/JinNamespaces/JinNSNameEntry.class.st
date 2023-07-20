Class {
	#name : #JinNSNameEntry,
	#superclass : #Object,
	#instVars : [
		'parent',
		'name',
		'owner',
		'kind'
	],
	#category : #JinNamespaces
}

{ #category : #visiting }
JinNSNameEntry >> acceptVisitor: aJinNSVisitorCounter [

	aJinNSVisitorCounter visitNameEntry: self
]

{ #category : #accessing }
JinNSNameEntry >> allSymbols [

	^ { self }
]

{ #category : #accessing }
JinNSNameEntry >> anchor [

	^ parent anchor / self kind / name
]

{ #category : #accessing }
JinNSNameEntry >> assembly [

	^ parent assembly
]

{ #category : #testing }
JinNSNameEntry >> canBeFoundedInJinDAM: aJinDAMModel [

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
JinNSNameEntry >> containingSymbols [

	^ { self } , parent containingSymbols
]

{ #category : #'as yet unclassified' }
JinNSNameEntry >> findSymbol: aString [

	| noDollar |
	noDollar := aString copyReplaceAll: '$' with: ''.
	^ (name compare: noDollar caseSensitive: false) = 2
		  ifTrue: [ { self } ]
		  ifFalse: [ {  } ]
]

{ #category : #accessing }
JinNSNameEntry >> kind [
	^ kind
]

{ #category : #accessing }
JinNSNameEntry >> kind: aJinNSKind [ 
	kind := aJinNSKind
]

{ #category : #accessing }
JinNSNameEntry >> name [
	^ name
]

{ #category : #accessing }
JinNSNameEntry >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinNSNameEntry >> owner [
	^ owner
]

{ #category : #accessing }
JinNSNameEntry >> owner: aJinNSEntryOwner [
	owner := aJinNSEntryOwner.
]

{ #category : #accessing }
JinNSNameEntry >> parent [
	^ parent
]

{ #category : #accessing }
JinNSNameEntry >> parent: aParent [ 
	 parent := aParent 
]

{ #category : #'as yet unclassified' }
JinNSNameEntry >> parentChain [

	^ { self } , parent parentChain
]

{ #category : #accessing }
JinNSNameEntry >> printOn: aStream [

	aStream
		nextPutAll: name;
		nextPutAll: ':'.
	kind printOn: aStream.
	aStream nextPutAll: '::'.
	owner printOn: aStream
]

{ #category : #'as yet unclassified' }
JinNSNameEntry >> referersTo: aString [

	| lca lcb |
	lca := ((name copyReplaceAll: '_' with: '')
		        copyReplaceAll: '$'
		        with: '') asLowercase.

	lcb := ((aString copyReplaceAll: '_' with: '')
		        copyReplaceAll: '$'
		        with: '') asLowercase.
	^ lca = lcb
]
