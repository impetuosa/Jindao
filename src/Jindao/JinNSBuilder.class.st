Class {
	#name : #JinNSBuilder,
	#superclass : #JinNSAbstractImporter,
	#instVars : [
		'futures',
		'table',
		'externalNamespaces',
		'assemblyNamespaces'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #visiting }
JinNSBuilder >> addFuture: aFuture [

	futures add: aFuture
]

{ #category : #visiting }
JinNSBuilder >> addFutures: someFutures [

	futures addAll: someFutures
]

{ #category : #'as yet unclassified' }
JinNSBuilder >> assembly [
	 ^ assemblyNamespaces first 
]

{ #category : #initialization }
JinNSBuilder >> buildFor: anAccessProject [

	stack push: (self newExternalNamespaceFor: anAccessProject).
	stack push: (self newAssemblyNamespace: anAccessProject).

	anAccessProject acceptVisitor: self.
	
	futures inspect.
	self joinFutures. 
]

{ #category : #initialization }
JinNSBuilder >> initialize [

	super initialize.
	futures := OrderedCollection new .
	externalNamespaces := OrderedCollection new. 
	assemblyNamespaces := OrderedCollection new. 
]

{ #category : #initialization }
JinNSBuilder >> joinFutures [

	| roll |
	[ 
	futures
		detect: [ :f | f isFinished not ]
		ifFound: [ :f | 
			[ f waitForCompletion: 10 seconds ]
				on: TKTTimeoutException
				do: [ :e | " nothing really " ].
			roll := true ]
		ifNone: [ roll := false ] ] doWhileTrue: [ roll ]
]

{ #category : #'as yet unclassified' }
JinNSBuilder >> newAssemblyNamespace: aJinAccessProject [

	| new |
	new := super newAssemblyNamespace: aJinAccessProject.

	assemblyNamespaces add: new.
	^ new
]

{ #category : #'as yet unclassified' }
JinNSBuilder >> newExternalNamespaceFor: aJinAccessProject [

	| new |
	new := super newExternalNamespaceFor: aJinAccessProject.

	externalNamespaces add: new.
	^ new
]

{ #category : #'as yet unclassified' }
JinNSBuilder >> typeOwnerFor: aJinTable [

	^ JinNSEntryOwner new
		  type: aJinTable class;
		  name: (self uniqueNameFor: aJinTable);
		  contentHash: aJinTable contentHash;
		  yourself
]

{ #category : #'as yet unclassified' }
JinNSBuilder >> uniqueNameFor: aJinTable [
	
	^ ('.' join: (self copyStack reverse flatCollect: [ :a | 
			    { 
				    a tag.
				    a name } ])) , '.' , aJinTable name
]

{ #category : #visiting }
JinNSBuilder >> visitControls: aJinCachedEntityCollection for: aJinNSEntryOwner [

	self currentNamespace
		registerAll: aJinCachedEntityCollection allNames 
		kind: JinNSKind typeProperty
		owner: aJinNSEntryOwner
]

{ #category : #visiting }
JinNSBuilder >> visitForm: aJinForm [

	| importer owner |
	aJinForm ensureUnload.
	owner := self typeOwnerFor: aJinForm.
	self
		registerAndPushSubNameSpaceEntry: aJinForm name
		kind: JinNSKind form
		owner: owner
		during: [ 
			| content |
			content := aJinForm src.
			content = '' ifFalse: [ 
				importer := JinNSASTSymbolImporter new
					            owner: owner;
					            content: content;
					            isConcurrent: true;
					            stack: self copyStack.
				importer buildFormFor: self ].

			self visitControls: aJinForm controls for: owner ].
	aJinForm ensureUnload
]

{ #category : #visiting }
JinNSBuilder >> visitLibrary: aJinLibrary [

	^ JinNSLibrarySymbolImporter new
		  assembly: self currentAssemblyNamespace;
		  library: aJinLibrary;
		  isConcurrent: true;
		  buildFor: self
]

{ #category : #visiting }
JinNSBuilder >> visitMacro: aJinMacro [ 

]

{ #category : #'instance creation' }
JinNSBuilder >> visitModule: aJinModule [

	| isClass importer owner |
	isClass := aJinModule isClassModule.
	owner := self typeOwnerFor: aJinModule.


	self
		registerAndPushSubNameSpaceEntry: aJinModule name
		kind: (isClass
				 ifTrue: [ JinNSKind classModule ]
				 ifFalse: [ JinNSKind module ])
		owner: owner
		during: [ 
			importer := JinNSASTSymbolImporter new
				            owner: owner;
				            content: aJinModule src;
				            isConcurrent: true;
				            stack: self copyStack.
			isClass
				ifTrue: [ importer buildClassFor: self ]
				ifFalse: [ importer buildModuleFor: self ] ].
	aJinModule ensureUnload
]

{ #category : #visiting }
JinNSBuilder >> visitProject: aJinAccessProject [

	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject references.
	self visitCollection: aJinAccessProject forms.
	self visitCollection: aJinAccessProject reports.
	
	
	self visitCollection: aJinAccessProject tables.
	self visitCollection: aJinAccessProject queries.
	self visitCollection: aJinAccessProject relations.
	self visitCollection: aJinAccessProject macros
]

{ #category : #visiting }
JinNSBuilder >> visitQuery: aJinQuery [

	self visitTable: aJinQuery
]

{ #category : #visiting }
JinNSBuilder >> visitReference: aJinReference [

	aJinReference isAccessProject
		ifTrue: [ self halt ]
		ifFalse: [ aJinReference library acceptVisitor: self ]
]

{ #category : #visiting }
JinNSBuilder >> visitReport: aJinReport [

	| importer owner content |
	aJinReport ensureUnload.
	owner := self typeOwnerFor: aJinReport.
	self
		registerAndPushSubNameSpaceEntry: aJinReport name
		kind: JinNSKind report
		owner: owner
		during: [ 
			content := aJinReport src.
			content := content = '' ifFalse: [ 
				           importer := JinNSASTSymbolImporter new
					                       owner: owner;
					                       content: content;
					                       isConcurrent: true;
					                       stack: self copyStack.
				           importer buildReportFor: self ].
			self visitControls: aJinReport controls for: owner ].
	aJinReport ensureUnload
]

{ #category : #visiting }
JinNSBuilder >> visitTable: aJinTable [

	| owner |
	owner := self typeOwnerFor: aJinTable.
	self
		registerAndPushSubNameSpaceEntry: aJinTable name
		kind: JinNSKind table
		owner: owner
		during: [ 
			aJinTable fields do: [ :f | 
				self currentNamespace
					register: f name
					kind: JinNSKind field
					owner: owner ] ].
	aJinTable ensureUnload
]

{ #category : #visiting }
JinNSBuilder >> visitTableRelation: aJinTableRelation [ 

]
