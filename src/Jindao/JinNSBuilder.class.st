Class {
	#name : #JinNSBuilder,
	#superclass : #JinNSAbstractImporter,
	#instVars : [
		'futures',
		'table',
		'externalNamespaces',
		'assemblyNamespaces',
		'visitedReferences'
	],
	#classInstVars : [
		'instances'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #'instance creation' }
JinNSBuilder class >> instances [

	^ instances ifNil: [ instances := OrderedCollection new ]
]

{ #category : #'instance creation' }
JinNSBuilder class >> newRegisteredBuilder [

	^ self instances add: self new
]

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
	stack push: (self
			 newAssemblyNamespace: anAccessProject
			 owner: (self typeOwnerFor: anAccessProject)).
	visitedReferences add: anAccessProject path fullName asLowercase.
	anAccessProject acceptVisitor: self.

	self joinFutures.
	self checkTasksSanity.
	^ JinNSSymbolTable new
		  external: externalNamespaces;
		  assembly: assemblyNamespaces;
		  yourself
]

{ #category : #initialization }
JinNSBuilder >> checkTasksSanity [

	(futures anySatisfy: [ :f | f isFailure ]) ifTrue: [ 
		| pct |
		pct := (futures select: [ :f | f isFailure ]) size / futures size
		       * 100 asFloat.
		self notify: '%' , pct asString
			,
			' of the indexing tasks failed. Inspect futures collection to have insight on the problem' ]
]

{ #category : #initialization }
JinNSBuilder >> initialize [

	super initialize.
	futures := OrderedCollection new .
	externalNamespaces := OrderedCollection new. 
	assemblyNamespaces := OrderedCollection new. 
	visitedReferences := OrderedCollection new. 
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
JinNSBuilder >> newAssemblyNamespace: aJinAccessProject owner: anOwner [

	| new |
	new := super newAssemblyNamespace: aJinAccessProject owner: anOwner.

	assemblyNamespaces add: new.
	^ new
]

{ #category : #'as yet unclassified' }
JinNSBuilder >> newExternalNamespaceFor: aJinAccessProject [

	| new |
	self assert: externalNamespaces isEmpty. 
	new := super newExternalNamespaceFor: aJinAccessProject.
	JinNSSDKLibraryBuilder new buildOn: new.
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

	^ ('.' join: (self copyStack reverse collect: [ :a | a name ])) , '.'
	  , aJinTable name
]

{ #category : #visiting }
JinNSBuilder >> visitCollection: aCollection from: project [

	1 to: aCollection value size do: [ :i | 
		" Try to visit. If it fails it restarts the project and it does continue. If it fails twice it let the exception to go "
		[ (aCollection value at: i) acceptVisitor: self ]
			on: Error
			do: [ :e | 
				project reopen.
				(aCollection value at: i) acceptVisitor: self ] ]
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
		registerAndPushSubNameSpaceEntry: 'Form_' , aJinForm name
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

	self visitCollection: [aJinAccessProject modules] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject references] from: aJinAccessProject.
	
	self visitCollection: [aJinAccessProject forms] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject reports] from: aJinAccessProject.
	
	
	self visitCollection: [aJinAccessProject tables] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject queries] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject relations] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject macros] from: aJinAccessProject
]

{ #category : #visiting }
JinNSBuilder >> visitQuery: aJinQuery [

	self visitTable: aJinQuery
]

{ #category : #visiting }
JinNSBuilder >> visitReference: aJinReference [

	(visitedReferences includes: aJinReference path fullName asLowercase) 
		ifFalse: [ 
			visitedReferences add: aJinReference path fullName asLowercase.

			aJinReference isAccessProject
				ifTrue: [ 
					| project |
					project := JinAccessApplication default open:
						           aJinReference path asFileReference.

					self
						pushNewAssemblyFor: aJinReference
						owner: (self typeOwnerFor: project).
					project acceptVisitor: self.
					project closeAndQuit.
					self popAssemblyFor: project ]
				ifFalse: [ 
					self
						pushNewAssemblyFor: aJinReference
						owner: (self typeOwnerFor: aJinReference library).

					aJinReference library acceptVisitor: self.
					self popAssemblyFor: aJinReference. 
					 ] ].
	self currentAssemblyNamespace installAllAssemblySymbolsFrom:
		(assemblyNamespaces detect: [ :a | 
			 a name = aJinReference name ])
]

{ #category : #visiting }
JinNSBuilder >> visitReport: aJinReport [

	| importer owner content |
	aJinReport ensureUnload.
	owner := self typeOwnerFor: aJinReport.
	self
		registerAndPushSubNameSpaceEntry: 'Report_' , aJinReport name
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
