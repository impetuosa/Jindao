Class {
	#name : #JinNSLibrarySymbolImporter,
	#superclass : #JinNSAbstractImporter,
	#instVars : [
		'assembly',
		'library',
		'owner',
		'static'
	],
	#category : #'JinNamespaces-Importer'
}

{ #category : #accessing }
JinNSLibrarySymbolImporter >> assembly: aJinNSNamespace [

	assembly := aJinNSNamespace.
	stack := Stack new.
	stack push: assembly
]

{ #category : #building }
JinNSLibrarySymbolImporter >> build [
	self shouldBeImplemented.
]

{ #category : #building }
JinNSLibrarySymbolImporter >> buildFor: aJinNSBuilder [

	futureRegistry := aJinNSBuilder.
	"The builder is required to register whatever future we may offer"

	self visitCollection: library types
	"self visitCollection: library functions. "
]

{ #category : #accessing }
JinNSLibrarySymbolImporter >> buildingModule [
	 ^ true 
]

{ #category : #'as yet unclassified' }
JinNSLibrarySymbolImporter >> currentExternalNamespace [

	^ self currentAssemblyNamespace 
]

{ #category : #'as yet unclassified' }
JinNSLibrarySymbolImporter >> currentNamespace [

	^ static
		  ifTrue: [ assembly ]
		  ifFalse: [ stack top ]
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> initialize [

	super initialize.
	static := false
]

{ #category : #building }
JinNSLibrarySymbolImporter >> isConcurrent: aBool [

	isConcurrent := false.
	self
		assert: aBool not
		description:
		'The library symbol importer is not suitable for concurrent access, since COM interface for pharo is not suitable '
]

{ #category : #accessing }
JinNSLibrarySymbolImporter >> library: aJinLibrary [ 
	library := aJinLibrary
]

{ #category : #accessing }
JinNSLibrarySymbolImporter >> owner [

	^ owner ifNil: [ 
		  owner := JinNSEntryOwner new
			           type: library class;
			           name: library name;
			           contentHash: library contentHash;
			           yourself ]
]

{ #category : #building }
JinNSLibrarySymbolImporter >> register: aString kind: aJinNSKind owner: aJinNSEntryOwner [

	| entry |
	entry := self currentNamespace
		         register: aString
		         kind: aJinNSKind
		         owner: aJinNSEntryOwner.
	static ifTrue: [ entry parent: stack top ].

	^ entry
]

{ #category : #'as yet unclassified' }
JinNSLibrarySymbolImporter >> runner [

	^ TKTConfiguration runner
]

{ #category : #'as yet unclassified' }
JinNSLibrarySymbolImporter >> visitCollection: aCollection [

	aCollection do: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryAlias: aJinLibraryAlias [

(	assembly
		register: aJinLibraryAlias name 
		kind: JinNSKind classAlias
		owner: self owner) parent: stack top. 
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryCoClass: aJinLibraryCoClass [
	static := true.
	self
		registerAndPushSubNameSpaceEntry: aJinLibraryCoClass name
		kind: JinNSKind classModule
		owner: self owner
		during: [ 
			aJinLibraryCoClass linkedType ifNotNil: [ 
				self visitCollection: aJinLibraryCoClass linkedType definitions ] ].
	static := false.
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryConstant: aJinLibraryConstant [

	(assembly
		register: aJinLibraryConstant name
		kind: JinNSKind constant
		owner: self owner) parent: stack top 
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryDispatchInterface: aJinLibraryDispatchInterface [

	self visitLibraryInterface: aJinLibraryDispatchInterface
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryEnum: aJinLibraryEnum [

	self
		registerSubNamespace: aJinLibraryEnum name
		kind: JinNSKind enum
		owner: self owner
		visibility: #Public
		during: [ 
			aJinLibraryEnum values do: [ :v | 
				self
					register: v name
					kind: JinNSKind enumEntry
					owner: self owner
					visibility: #Public ] ]
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryFunction: aJinLibraryFunction [

	self halt:
		' Should we? functions at this level seem to be private and non available for VBA developper'
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryInterface: aJinLibraryInterface [

	self
		registerAndPushSubNameSpaceEntry: aJinLibraryInterface name
		kind: JinNSKind classModule
		owner: self owner
		during: [ self visitCollection: aJinLibraryInterface definitions ]
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryMethod: aJinLibraryMethod [

	self 
		register: aJinLibraryMethod selector
		kind: JinNSKind function
		owner: self owner.
	(aJinLibraryMethod selector includesSubstring: '_') ifTrue: [ 
		| pieces |
		pieces := '_' split: aJinLibraryMethod selector.
		self 
			register: pieces last
			kind: JinNSKind function
			owner: self owner ]
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryModule: aJinLibraryModule [

	static := true.
	self
		registerAndPushSubNameSpaceEntry: aJinLibraryModule name
		kind: JinNSKind module
		owner: self owner
		during: [ self visitCollection: aJinLibraryModule definitions ].
	static := false
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryProperty: aJinLibraryProperty [

	self 
		register: aJinLibraryProperty name
		kind: JinNSKind typeProperty
		owner: self owner.
	aJinLibraryProperty setter ifNotNil: [ :s | s acceptVisitor: self ].
	aJinLibraryProperty getter ifNotNil: [ :s | s acceptVisitor: self ]
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryStructure: aJinLibraryStructure [

	self
		registerAndPushSubNameSpaceEntry: aJinLibraryStructure name
		kind: JinNSKind struct
		owner: self owner
		during: [ 
			aJinLibraryStructure instanceVariables do: [ :v | 
				self
					register: v name
					kind: JinNSKind typeProperty
					owner: self owner ] ]
]
