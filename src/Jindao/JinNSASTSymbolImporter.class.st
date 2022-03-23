Class {
	#name : #JinNSASTSymbolImporter,
	#superclass : #JinNSAbstractImporter,
	#instVars : [
		'content',
		'ast',
		'result',
		'owner',
		'buildingModule'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #accessing }
JinNSASTSymbolImporter >> ast [

	| semaphore process |
	ast ifNotNil: [ ^ ast ].
	isConcurrent ifTrue: [ 
		ast := (self class environment at: #VBParser) parse: content.
		^ ast ].

	semaphore := Semaphore new.
	process := [ 
	           [ 
	           ast := (self class environment at: #VBParser) parse:
		                  content ]
		           on: Error
		           do: [ :e | ast := e ].
	           semaphore signal ] forkAt:
		           Processor userBackgroundPriority.
	semaphore
		wait: 30 seconds
		onCompletion: [ 
			process terminate.
			ast isError ifTrue: [ ^ ast signal ].
			^ ast ]
		onTimeout: [ 
			process terminate.
			TimedOut new signal: 'TO' ].
	self halt: 'whut?'
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> buildClassFor: aJinNSBuilder [

	| ret |
	buildingModule := false.
	ret := self buildFor: aJinNSBuilder.


	^ ret
]

{ #category : #building }
JinNSASTSymbolImporter >> buildFor: aJinNSBuilder [

	futureRegistry := aJinNSBuilder.
	isConcurrent
		ifTrue: [ 
			futureRegistry addFuture: ([ 
				 [ self ast acceptVisitor: self ]
					 on: Error
					 do: [ :e |( (e isKindOf: SmaCCParserError) or: [ e isKindOf: TKTCancelledTaskException ] ) ifFalse: [ self halt] ] ] asTask future: self runner timeout: 45 second ) ]
		ifFalse: [ self ast acceptVisitor: self ]
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> buildFormFor: aJinNSBuilder [

	^ self buildClassFor: aJinNSBuilder
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> buildModuleFor: aJinNSBuilder [

	| ret |
	buildingModule := true.
	ret := self buildFor: aJinNSBuilder.


	^ ret
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> buildReportFor: aJinNSBuilder [ 
	self buildClassFor: aJinNSBuilder
]

{ #category : #accessing }
JinNSASTSymbolImporter >> buildingModule [
	^ buildingModule
]

{ #category : #accessing }
JinNSASTSymbolImporter >> content: aString [ 
	content := aString
]

{ #category : #accessing }
JinNSASTSymbolImporter >> owner: aJinNSEntryOwner [ 
	 owner := aJinNSEntryOwner 
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> runner [

	^ TKTConfiguration runner
]

{ #category : #accessing }
JinNSASTSymbolImporter >> visitCollection: aCollection [

	aCollection do: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitDefineEnum: aVBDefineEnumNode [

	| enumNs |
	buildingModule := buildingModule ifNil: [ true ].
	enumNs := self
		          registerSubNamespace: aVBDefineEnumNode name token value
		          kind: JinNSKind enum
		          owner: owner
		          visibility: aVBDefineEnumNode visibility value
		          during: [  ].

	aVBDefineEnumNode fields do: [ :f | 
		(self
			 register: f name token value
			 kind: JinNSKind enumEntry
			 owner: owner
			 visibility: aVBDefineEnumNode visibility value) parent: enumNs ]
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitDefineType: aVBDefineTypeNode [

	self
		registerSubNamespace: aVBDefineTypeNode name token value asSymbol
		kind: JinNSKind userType 
		owner: owner
		visibility: aVBDefineTypeNode visibility value
		during: [ 
			aVBDefineTypeNode fields do: [ :f | 
				self currentNamespace
					register: f name token value asSymbol
					kind: JinNSKind typeProperty
					owner: owner ] ]
]

{ #category : #accessing }
JinNSASTSymbolImporter >> visitDimMultipleVariables: avar [

	self visitCollection: avar variables variables
]

{ #category : #accessing }
JinNSASTSymbolImporter >> visitDimVariable: dimVar [
	 self visitVariable: dimVar variable 
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitEvent: anEvent [

	self
		registerSubNamespace: anEvent selector token value asSymbol
		kind: JinNSKind event
		owner: owner
		visibility: anEvent visibility value
		during: [ 
			self visitCollection:
				(anEvent allNodesSelect: [ :n | n isKindOf: VBParameterNode ]) ]
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitExternalFunction: aVBFunctionDefinitionNode [

	self
		registerSubNamespace:
		aVBFunctionDefinitionNode selector token value asSymbol
		kind: JinNSKind externalFunction 
		owner: owner
		visibility: aVBFunctionDefinitionNode visibility value
		during: [ 
			self visitCollection:
				(aVBFunctionDefinitionNode allNodesSelect: [ :n | 
					 n isKindOf: VBParameterNode ]) ]
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitExternalSub: aVBFunctionDefinitionNode [

	self
		registerSubNamespace:
		aVBFunctionDefinitionNode selector token value asSymbol
		kind: JinNSKind externalFunction 
		owner: owner
		visibility: aVBFunctionDefinitionNode visibility value
		during: [ 
			self visitCollection:
				(aVBFunctionDefinitionNode allNodesSelect: [ :n | 
					 n isKindOf: VBParameterNode ]) ]
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitFunctionDefinition: aVBFunctionDefinitionNode [

	self
		registerSubNamespace:
		aVBFunctionDefinitionNode selector token value asSymbol
		kind: JinNSKind function
		owner: owner
		visibility: aVBFunctionDefinitionNode visibility value
		during: [ 
			self visitCollection:
				(aVBFunctionDefinitionNode allNodesSelect: [ :n | 
					 n isKindOf: VBParameterNode ]).

			self visitCollection:
				(aVBFunctionDefinitionNode allNodesSelect: [ :n | 
					 n isKindOf: VBVariableNode ]) ]
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitImplements: anImplements [
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitModule: aVBModuleNode [

	self visitCollection: aVBModuleNode elements
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitModuleConstant: aVBModuleConstantNode [

	self
		register: aVBModuleConstantNode constant constant token value
		kind: JinNSKind constant
		owner: owner
		visibility: aVBModuleConstantNode visibility value
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> visitModuleMultipleProperties: props [
	self visitCollection: 	 props variables variables
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitModuleProperty: aVBModulePropertyNode [

	self
		register: aVBModulePropertyNode variable name token value asSymbol 
		kind: JinNSKind variable 
		owner: owner
		visibility: aVBModulePropertyNode visibility value asSymbol
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitModulePropertyGet: aVBModulePropertyGetNode [

	| kind |
	aVBModulePropertyGetNode getToken isNil ifFalse: [ 
		kind := JinNSKind get ].
	aVBModulePropertyGetNode setToken isNil ifFalse: [ 
		kind := JinNSKind set ].
	aVBModulePropertyGetNode letToken isNil ifFalse: [ 
		kind := JinNSKind let ].
	self assert: kind isNotNil.
	self
		registerSubNamespace:
		aVBModulePropertyGetNode selector token value asSymbol
		kind: kind
		owner: owner
		visibility: aVBModulePropertyGetNode visibility value 
		during: [ 
			self visitCollection:
				(aVBModulePropertyGetNode allNodesSelect: [ :n | 
					 n isKindOf: VBParameterNode ]).

			self visitCollection:
				(aVBModulePropertyGetNode allNodesSelect: [ :n | 
					 n isKindOf: VBVariableNode ]) ]
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitOptionBase: aVBOptionCompareDatabaseNode [ 

]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitOptionCompareDatabase: aVBOptionCompareDatabaseNode [ 

]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitOptionExplicit: aVBOptionExplicitNode [ 

]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitParameter: aVBParameterNode [

	self currentNamespace
		register: aVBParameterNode name token value
		kind: JinNSKind parameter
		owner: owner
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitSubDefinition: aVBSubDefinitionNode [ 
	
	self
		registerSubNamespace:
		aVBSubDefinitionNode selector token value asSymbol
		kind: JinNSKind sub
		owner: owner
		visibility: aVBSubDefinitionNode visibility value
		during: [ 
			self visitCollection:
				(aVBSubDefinitionNode allNodesSelect: [ :n | 
					 n isKindOf: VBParameterNode ]).

			self visitCollection:
				(aVBSubDefinitionNode allNodesSelect: [ :n | 
					 n isKindOf: VBVariableNode ]) ]
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitVariable: aVBVariableNode [ 

	self currentNamespace
		register: aVBVariableNode name token value
		kind: JinNSKind parameter
		owner: owner
]
