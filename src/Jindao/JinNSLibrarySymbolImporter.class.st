Class {
	#name : #JinNSLibrarySymbolImporter,
	#superclass : #JinNSAbstractImporter,
	#instVars : [
		'assembly',
		'library',
		'owner'
	],
	#category : #'Jindao-NamespaceIndex'
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
	"	isConcurrent
		ifTrue: [ 
			futureRegistry addFuture: ([ 
				 [ self visitCollection: library types ]
					 on: Error
					 do: [ :e | self halt ] ] future: self runner) ]
		ifFalse: [ ""	self visitCollection: library functions. "" 
			self visitCollection: library types ]"
]

{ #category : #'as yet unclassified' }
JinNSLibrarySymbolImporter >> currentNamespace [

	^ stack top
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
			           name: library uniqueName;
			           contentHash: library contentHash;
			           yourself ]
]

{ #category : #'as yet unclassified' }
JinNSLibrarySymbolImporter >> runner [

	^ TKTConfiguration runner
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryAlias: aJinLibraryAlias [

	assembly
		register: aJinLibraryAlias name 
		kind: JinNSKind classAlias
		owner: self owner
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryCoClass: aJinLibraryCoClass [

	self
		registerAndPushSubNameSpaceEntry: aJinLibraryCoClass name
		kind: JinNSKind classModule
		owner: self owner
		during: [ 
			aJinLibraryCoClass linkedType ifNotNil: [ 
				self visitCollection: aJinLibraryCoClass linkedType definitions ] ]
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryConstant: aJinLibraryConstant [

	assembly
		register: aJinLibraryConstant name
		kind: JinNSKind constant
		owner: self owner
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryDispatchInterface: aJinLibraryDispatchInterface [

	self visitLibraryInterface: aJinLibraryDispatchInterface
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryEnum: aJinLibraryEnum [

	assembly
		register: aJinLibraryEnum name
		kind: JinNSKind enum
		owner: self owner.
	aJinLibraryEnum values do: [ :v | 
		assembly
			register: v name
			kind: JinNSKind enumEntry
			owner: self owner ]
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

	self currentNamespace
		register: aJinLibraryMethod selector
		kind: JinNSKind function
		owner: self owner.
	(aJinLibraryMethod selector includesSubstring: '_') ifTrue: [ 
		| pieces |
		pieces := '_' split: aJinLibraryMethod selector.
		self currentNamespace
			register: pieces last
			kind: JinNSKind function
			owner: self owner ]
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryModule: aJinLibraryModule [

	assembly
		register: aJinLibraryModule name
		kind: JinNSKind module
		owner: self owner.
	self visitCollection: aJinLibraryModule definitions
]

{ #category : #visiting }
JinNSLibrarySymbolImporter >> visitLibraryProperty: aJinLibraryProperty [

	self currentNamespace
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
				self currentNamespace
					register: v name
					kind: JinNSKind typeProperty
					owner: self owner ] ]
]
