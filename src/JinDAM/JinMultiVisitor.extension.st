Extension { #name : #JinMultiVisitor }

{ #category : #'*JinDAM' }
JinMultiVisitor >> currentNamespace [

	| reverseStack ns temp |
	reverseStack := self state reverse.
	ns := self symbolTable
		      namespaceFor: reverseStack first
		      kind: reverseStack first relatedSymbolKind.

	^ reverseStack allButFirst inject: ns first into: [ :nns :element | 
		  temp := nns
			          namespaceFor: element name
			          kind: element relatedSymbolKind.

		  temp first kind isInvocable ifTrue: [ ^ temp first ].
		  (temp first kind isType and: [ temp first owner type = JinLibrary ]) 
			  ifTrue: [ ^ temp first parent].
		  temp first ]
]

{ #category : #'*JinDAM' }
JinMultiVisitor >> instantiateReferenceForNames: names context: aContext [

	| symbols tip |
	symbols := self currentNamespace findSymbol: names first.

	self assert: symbols size < 2.
	tip := self
		       instantiateReferenceForSymbol: (symbols ifEmpty:[ nil ] ifNotEmpty: [ symbols first ])
		       name: names first
		       context: aContext.

	names allButFirst inject:  (symbols ifEmpty:[ nil ] ifNotEmpty: [ symbols first ]) into: [ :acc :name | 
		symbols := acc ifNil: [ {  } ] ifNotNil: [ acc findSymbol: name ].
		self assert: symbols size < 2.
		tip := self
			       instantiateReferenceForSymbol:
			       (symbols ifEmpty: [ nil ] ifNotEmpty: [ symbols first ])
			       name: name
			       context: tip.
		symbols ifEmpty: [ nil ] ifNotEmpty: [ symbols first ] ].
	^ tip
]

{ #category : #'*JinDAM' }
JinMultiVisitor >> instantiateReferenceForNames: names context: aContext preferring: rules [

	| select symbols tip |
	symbols := self currentNamespace findSymbol: names first.

	symbols size > 1 ifTrue: [ 
		select := symbols select: [ :s | 
			          rules anySatisfy: [ :r | s kind perform: r ] ].
		self assert: select isNotEmpty.
		symbols := select ].


	tip := self
		       instantiateReferenceForSymbol:
		       (symbols ifEmpty: [ nil ] ifNotEmpty: [ symbols first ])
		       name: names first
		       context: aContext.

	names allButFirst
		inject: (symbols ifEmpty: [ nil ] ifNotEmpty: [ symbols first ])
		into: [ :acc :name | 
			symbols := acc ifNil: [ {  } ] ifNotNil: [ acc findSymbol: name ].
			symbols size > 1 ifTrue: [ 
				select := symbols select: [ :s | 
					          rules anySatisfy: [ :r | s kind perform: r ] ].
				self assert: select isNotEmpty.
				symbols := select ].
			tip := self
				       instantiateReferenceForSymbol:
				       (symbols ifEmpty: [ nil ] ifNotEmpty: [ symbols first ])
				       name: name
				       context: tip.
			symbols ifEmpty: [ nil ] ifNotEmpty: [ symbols first ] ].
	^ tip
]

{ #category : #'*JinDAM' }
JinMultiVisitor >> instantiateReferenceForSymbol: symbol name: aName context: context [

	| inter |
	symbol
		ifNil: [ 
			inter := self instantiate: JinDAMMemberReference.
			inter name: aName ]
		ifNotNil: [ 
			symbol kind isAssembly ifTrue: [ 
				inter := self instantiate: JinDAMLibraryReference.
				inter name: aName ].
			symbol kind isEnumEntry ifTrue: [ 
				inter := self instantiate: JinDAMTypeReference.
				inter typeName: aName ].
			symbol kind isType ifTrue: [ 
				inter := self instantiate: JinDAMTypeReference.
				inter typeName: aName ].
			symbol kind isAttribute ifTrue: [ 
				inter := self instantiate: JinDAMMemberReference.
				inter name: aName ].
			symbol kind isInvocable ifTrue: [ 
				inter := self instantiate: JinDAMMemberReference.
				inter selector: aName ].
			symbol anchor ifNil: [ self halt ].
			inter candidateAnchor: symbol anchor ].
	inter context: context.
	^ inter
]
