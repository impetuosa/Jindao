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

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> assemblyRegisterAndPushSubNameSpaceEntry: aString kind: aJinNSKind owner: aJinNSEntryOwner during: aFullBlockClosure [

	| ns |
	ns := self currentAssemblyNamespace
		      registerSubNamespace: aString
		      kind: aJinNSKind
		      owner: aJinNSEntryOwner.
	self push: ns during: aFullBlockClosure
]

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

	buildingModule := false.
	self buildFor: aJinNSBuilder
]

{ #category : #building }
JinNSASTSymbolImporter >> buildFor: aJinNSBuilder [

	futureRegistry := aJinNSBuilder.
	isConcurrent
		ifTrue: [ 
			futureRegistry addFuture: ([ 
				 [ self ast acceptVisitor: self ]
					 on: Error
					 do: [ :e | self halt ] ] future: self runner) ]
		ifFalse: [ self ast acceptVisitor: self ]
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> buildFormFor: aJinNSBuilder [ 
	 ^ self buildClassFor: aJinNSBuilder 
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> buildModuleFor: aJinNSBuilder [ 
	 buildingModule := true. 
	^ self buildFor: aJinNSBuilder 
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

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> externalRegisterAndPushSubNameSpaceEntry: aString kind: aJinNSKind owner: aJinNSEntryOwner during: aFullBlockClosure [

	| ns |
	ns := self currentExternalNamespace
		      registerSubNamespace: aString
		      kind: aJinNSKind
		      owner: aJinNSEntryOwner.
	self push: ns during: aFullBlockClosure
]

{ #category : #accessing }
JinNSASTSymbolImporter >> owner: aJinNSEntryOwner [ 
	 owner := aJinNSEntryOwner 
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> register: aName kind: aJinNSKind owner: aJinNSEntryOwner visibility: aVisibility [ 
	| visibility | 
	visibility := aVisibility ifNil: [ #Friend ] ifNotNil: [ aVisibility asSymbol ].
	 self assert: (#(Public Private Friend) includes: visibility ).
	visibility = #Public ifTrue: [ 
		self currentExternalNamespace 	register: aName kind: aJinNSKind owner: aJinNSEntryOwner.
	].
	visibility = #Friend ifTrue: [ 
		self currentAssemblyNamespace 	register: aName kind: aJinNSKind owner: aJinNSEntryOwner 		
	 ].
	visibility = #Private ifTrue: [ 
		self currentNamespace register: aName kind: aJinNSKind owner: aJinNSEntryOwner 	
	]
	
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> registerSubNamespace: aName kind: aJinNSKind owner: aJinNSEntryOwner visibility: aVisibility during: aFullBlockClosure [

	| visibility |
	visibility := aVisibility
		              ifNil: [ #Friend ]
		              ifNotNil: [ :a | a asSymbol ].
	self assert: (#( Public Private Friend ) includes: visibility).

	self buildingModule ifFalse: [ 
		self
			registerAndPushSubNameSpaceEntry: aName
			kind: aJinNSKind
			owner: aJinNSEntryOwner
			during: aFullBlockClosure.
		^ self ].

	visibility = #Public ifTrue: [ 
		self
			externalRegisterAndPushSubNameSpaceEntry: aName
			kind: aJinNSKind
			owner: aJinNSEntryOwner
			during: aFullBlockClosure ].
	visibility = #Friend ifTrue: [ 
		self
			assemblyRegisterAndPushSubNameSpaceEntry: aName
			kind: aJinNSKind
			owner: aJinNSEntryOwner
			during: aFullBlockClosure ].
	visibility = #Private ifTrue: [ 
		self
			registerAndPushSubNameSpaceEntry: aName
			kind: aJinNSKind
			owner: aJinNSEntryOwner
			during: aFullBlockClosure ]
]

{ #category : #'as yet unclassified' }
JinNSASTSymbolImporter >> runner [

	^ TKTConfiguration runner
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitDefineEnum: aVBDefineEnumNode [

	self
		register: aVBDefineEnumNode name token value
		kind: JinNSKind enum
		owner: owner
		visibility: aVBDefineEnumNode visibility value.
	aVBDefineEnumNode fields do: [ :f | 
		self
			register: f name token value
			kind: JinNSKind enumEntry
			owner: owner
			visibility: aVBDefineEnumNode visibility value ]
]

{ #category : #visiting }
JinNSASTSymbolImporter >> visitDefineType: aVBDefineTypeNode [

	self
		registerSubNamespace: aVBDefineTypeNode name token value asSymbol
		kind: JinNSKind sub
		owner: owner
		visibility: aVBDefineTypeNode visibility value
		during: [ 
			aVBDefineTypeNode fields do: [ :f | 
				self currentNamespace
					register: f name token value asSymbol
					kind: JinNSKind typeProperty
					owner: owner ] ]
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
		visibility: aVBModulePropertyGetNode visibility value asSymbol
		during: [ 
			self visitCollection:
				(aVBModulePropertyGetNode allNodesSelect: [ :n | 
					 n isKindOf: VBParameterNode ]).

			self visitCollection:
				(aVBModulePropertyGetNode allNodesSelect: [ :n | 
					 n isKindOf: VBVariableNode ]) ]
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
