Class {
	#name : #JinNSAbstractImporter,
	#superclass : #Object,
	#instVars : [
		'stack',
		'stackMutex',
		'isConcurrent',
		'futureRegistry'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> assemblyRegisterAndPushSubNameSpaceEntry: aString kind: aJinNSKind owner: aJinNSEntryOwner during: aFullBlockClosure [

	| ns |
	ns := self currentAssemblyNamespace
		      registerSubNamespace: aString
		      kind: aJinNSKind
		      owner: aJinNSEntryOwner.
	ns parent: self currentNamespace.
	self push: ns during: aFullBlockClosure.
	^ ns
]

{ #category : #'instance creation' }
JinNSAbstractImporter >> beConcurrent [

	isConcurrent := true
]

{ #category : #accessing }
JinNSAbstractImporter >> copyStack [

	| cp |
	stackMutex critical: [ cp := stack copy ].
	^ cp
]

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> currentAssemblyNamespace [

	^ self enclosingNamespaceTagged: JinNSKind assembly 
]

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> currentExternalNamespace [

	^ self enclosingNamespaceTagged: #external
]

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> currentNamespace [
	 ^ self copyStack top 
]

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> enclosingNamespaceTagged: aTag [

	^ self copyStack
		  detect: [ :ns | ns tag = aTag  ]
		  ifNone: [ self error: 'Not found enclosing tag ' , aTag ]
]

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> externalRegisterAndPushSubNameSpaceEntry: aString kind: aJinNSKind owner: aJinNSEntryOwner during: aFullBlockClosure [

	| ns |
	ns := self currentExternalNamespace
		      registerSubNamespace: aString
		      kind: aJinNSKind
		      owner: aJinNSEntryOwner.
	ns parent: self currentNamespace.
	self push: ns during: aFullBlockClosure.
	^ ns 
]

{ #category : #'instance creation' }
JinNSAbstractImporter >> futureRegistry: anAddFuturesUnderstandingObject [

	futureRegistry := anAddFuturesUnderstandingObject
]

{ #category : #initialization }
JinNSAbstractImporter >> initialize [

	super initialize.
	stack := Stack new.
	stackMutex := Mutex new.
	isConcurrent := false. 
]

{ #category : #'instance creation' }
JinNSAbstractImporter >> isConcurrent: abool [
	 isConcurrent := abool.
]

{ #category : #'instance creation' }
JinNSAbstractImporter >> newAssemblyNamespace: aJinAccessProject owner: anOwner [

	| parent |
	parent := self currentExternalNamespace.
	"self assert: parent name = aJinAccessProject name."
	^ (parent
		   registerSubNamespace: aJinAccessProject name
		   kind: JinNSKind assembly
		   owner: anOwner)
		  path: aJinAccessProject path;
		  yourself
]

{ #category : #'instance creation' }
JinNSAbstractImporter >> newExternalNamespaceFor: aJinAccessProject [

	| new |
	new := JinNSNamespace new
		       tag: #external;
		       name: aJinAccessProject name;
		       yourself.

	^ new
]

{ #category : #initialization }
JinNSAbstractImporter >> popAssemblyFor: project [

	| assembly |
	stackMutex critical: [ 
		self assert: stack top name = project name.
		assembly := stack pop ].
	^ assembly
]

{ #category : #initialization }
JinNSAbstractImporter >> push: aJinNSNamespace during: aFullBlockClosure [

	| ret |
	stackMutex critical: [ 
		stack push: aJinNSNamespace.
		[ aFullBlockClosure value ] ensure: [ ret := stack pop ] ].
	^ ret
]

{ #category : #initialization }
JinNSAbstractImporter >> pushNewAssemblyFor: aProject owner: anOwner [

	| assembly |
	assembly := self newAssemblyNamespace: aProject owner: anOwner.
	stackMutex critical: [ stack push: assembly ].
	^ assembly
]

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> register: aName kind: aJinNSKind owner: aJinNSEntryOwner visibility: aVisibility [

	| visibility ret |
	visibility := aVisibility
		              ifNil: [ #Friend ]
		              ifNotNil: [ aVisibility asSymbol ].
	self assert: (#( Global Public Private Friend ) includes: visibility).
	(visibility = #Public or: [ visibility = #Global ]) ifTrue: [ 
		ret := (self currentExternalNamespace
			        register: aName
			        kind: aJinNSKind
			        owner: aJinNSEntryOwner) parent: self currentNamespace ].
	visibility = #Friend ifTrue: [ 
		ret := (self currentAssemblyNamespace
			        register: aName
			        kind: aJinNSKind
			        owner: aJinNSEntryOwner) parent: self currentNamespace ].
	visibility = #Private ifTrue: [ 
		ret := (self currentNamespace
			        register: aName
			        kind: aJinNSKind
			        owner: aJinNSEntryOwner) parent: self currentNamespace ].
	^ ret
]

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> registerAndPushSubNameSpaceEntry: aString kind: aJinNSKind owner: aJinNSEntryOwner during: aFullBlockClosure [

	| ns |
	ns := self currentNamespace
		      registerSubNamespace: aString
		      kind: aJinNSKind
		      owner: aJinNSEntryOwner.
	self push: ns during: aFullBlockClosure.
	^ ns
]

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> registerSubNamespace: aName kind: aJinNSKind owner: aJinNSEntryOwner visibility: aVisibility during: aFullBlockClosure [

	| visibility ret |
	visibility := aVisibility
		              ifNil: [ #Friend ]
		              ifNotNil: [ :a | a asSymbol ].
	self assert: (#( Public Private Friend ) includes: visibility).

	self buildingModule ifFalse: [ 
		^ self
			  registerAndPushSubNameSpaceEntry: aName
			  kind: aJinNSKind
			  owner: aJinNSEntryOwner
			  during: aFullBlockClosure ].

	visibility = #Public ifTrue: [ 
		ret := self
			       externalRegisterAndPushSubNameSpaceEntry: aName
			       kind: aJinNSKind
			       owner: aJinNSEntryOwner
			       during: aFullBlockClosure ].
	visibility = #Friend ifTrue: [ 
		ret := self
			       assemblyRegisterAndPushSubNameSpaceEntry: aName
			       kind: aJinNSKind
			       owner: aJinNSEntryOwner
			       during: aFullBlockClosure ].
	visibility = #Private ifTrue: [ 
		ret := self
			       registerAndPushSubNameSpaceEntry: aName
			       kind: aJinNSKind
			       owner: aJinNSEntryOwner
			       during: aFullBlockClosure ].
	^ ret
]

{ #category : #'as yet unclassified' }
JinNSAbstractImporter >> runner [ 
	 ^ TKTLocalProcessTaskRunner new 
]

{ #category : #accessing }
JinNSAbstractImporter >> stack: aStack [

	stackMutex critical: [ stack := aStack ]
]

{ #category : #visiting }
JinNSAbstractImporter >> visitCollection: aCollection [

	isConcurrent
		ifTrue: [ 
			futureRegistry addFutures:
				(aCollection collect: [ :a | [ [a acceptVisitor: self ] on:Error do:[ : e | self halt] ] asTask future: self runner  ]) ]
		ifFalse: [ aCollection do: [ :a | a acceptVisitor: self ] ]
]
