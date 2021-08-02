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
	^ parent
		  registerSubNamespace: aJinAccessProject path basename asLowercase 
		  kind: JinNSKind assembly
		  owner: anOwner
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
		self assert: stack top name = project path basename asLowercase.
		assembly := stack pop ].
	^ assembly
]

{ #category : #initialization }
JinNSAbstractImporter >> push: aJinNSNamespace during: aFullBlockClosure [

	| ret |
	stackMutex critical: [ 
		stack push: aJinNSNamespace.
		aFullBlockClosure value.
		ret := stack pop ].
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
JinNSAbstractImporter >> registerAndPushSubNameSpaceEntry: aString kind: aJinNSKind owner: aJinNSEntryOwner during: aFullBlockClosure [

	| ns |
	ns := self currentNamespace
		      registerSubNamespace: aString
		      kind: aJinNSKind
		      owner: aJinNSEntryOwner.
	self push: ns during: aFullBlockClosure
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
