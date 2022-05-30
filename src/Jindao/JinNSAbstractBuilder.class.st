Class {
	#name : #JinNSAbstractBuilder,
	#superclass : #JinNSAbstractImporter,
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #visiting }
JinNSAbstractBuilder >> addFuture: aFuture [

	 self subclassResponsibility 
]

{ #category : #visiting }
JinNSAbstractBuilder >> addFutures: someFutures [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
JinNSAbstractBuilder >> assemblyNamespaces [

	^ self subclassResponsibility
]

{ #category : #initialization }
JinNSAbstractBuilder >> buildFor: anAccessProject [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
JinNSAbstractBuilder >> externalNamespaces [
	 ^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
JinNSAbstractBuilder >> newAssemblyNamespace: aJinAccessProject owner: anOwner [

	| new |
	new := super newAssemblyNamespace: aJinAccessProject owner: anOwner.

	self assemblyNamespaces add: new.
	^ new
]

{ #category : #'as yet unclassified' }
JinNSAbstractBuilder >> newExternalNamespaceFor: aJinAccessProject [

	| new |
	self assert: self externalNamespaces isEmpty. 
	new := super newExternalNamespaceFor: aJinAccessProject.
	JinNSSDKLibraryBuilder new buildOn: new.
	self externalNamespaces add: new.
	^ new
]

{ #category : #'as yet unclassified' }
JinNSAbstractBuilder >> typeOwnerFor: aJinTable [
	^ JinNSEntryOwner new
		  type: aJinTable class;
		  name: (self uniqueNameFor: aJinTable);
		  contentHash: aJinTable contentHash;
		  yourself
]

{ #category : #'as yet unclassified' }
JinNSAbstractBuilder >> uniqueNameFor: aJinTable [

	^ aJinTable isRootElement
		  ifTrue: [ aJinTable path basename ]
		  ifFalse: [ 
			  ^ ('.' join:
				     (self copyStack allButLast reverse collect: [ :a | a name ]))
			    , '.' , aJinTable name ]
]

{ #category : #visiting }
JinNSAbstractBuilder >> visitCollection: aCollection from: project [

	| stackSize win32Error |
	stackSize := stack size.
	win32Error := false.
	1 to: aCollection value size do: [ :i | " Try to visit. If it fails it restarts the project and it does continue. If it fails twice it let the exception to go "
		[ (aCollection value at: i) acceptVisitor: self ]
			on: Win32Error
			do: [ :e | win32Error := true ].
		win32Error ifTrue: [ 
			win32Error := false.
			stack size = stackSize ifFalse: [ self halt: 'Umathching stacks!!' ].
			project reopen.
			(aCollection value at: i) acceptVisitor: self ] ]
]

{ #category : #visiting }
JinNSAbstractBuilder >> visitControls: aJinCachedEntityCollection for: aJinNSEntryOwner [

	self currentNamespace
		registerAll: aJinCachedEntityCollection allNames 
		kind: JinNSKind typeProperty
		owner: aJinNSEntryOwner
]

{ #category : #visiting }
JinNSAbstractBuilder >> visitForm: aJinForm [

	| importer owner |
	owner := self typeOwnerFor: aJinForm.
	self assert: stack top path isNotNil .
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
JinNSAbstractBuilder >> visitLibrary: aJinLibrary [

	^ JinNSLibrarySymbolImporter new
		  assembly: self currentAssemblyNamespace;
		  library: aJinLibrary;
		  buildFor: self
]

{ #category : #visiting }
JinNSAbstractBuilder >> visitMacro: aJinMacro [ 

]

{ #category : #'instance creation' }
JinNSAbstractBuilder >> visitModule: aJinModule [

	| isClass importer owner |
	self assert: stack top path isNotNil .
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
JinNSAbstractBuilder >> visitProject: aJinAccessProject [
 
   self visitCollection: [aJinAccessProject references] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject modules] from: aJinAccessProject.
	
	
	self visitCollection: [aJinAccessProject forms] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject reports] from: aJinAccessProject.
	
	
	self visitCollection: [aJinAccessProject tables] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject queries] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject relations] from: aJinAccessProject.
	self visitCollection: [aJinAccessProject macros] from: aJinAccessProject
]

{ #category : #visiting }
JinNSAbstractBuilder >> visitQuery: aJinQuery [

	self visitTable: aJinQuery
]

{ #category : #visiting }
JinNSAbstractBuilder >> visitReference: aJinReference [

	(self visitedReferences includes:
		 aJinReference path fullName asLowercase) ifFalse: [ 
		self visitedReferences add: aJinReference path fullName asLowercase.

		aJinReference isAccessProject
			ifTrue: [ 
				| project subbuilder |
				project := JinAccessApplication default open:
					           aJinReference path asFileReference.
				subbuilder := JinNSSubBuilder new.
				subbuilder
					subbuildFor: project
					builder: self
					reference: aJinReference.
				project closeAndQuit ]
			ifFalse: [ 
				self
					pushNewAssemblyFor: aJinReference
					owner: (self typeOwnerFor: aJinReference library).
				aJinReference library acceptVisitor: self.
				self popAssemblyFor: aJinReference ] ].



	self assemblyNamespaces
		detect: [ :a | a name = aJinReference name ]
		ifFound: [ :a | self currentAssemblyNamespace addFriend: a ]
]

{ #category : #visiting }
JinNSAbstractBuilder >> visitReport: aJinReport [

	| importer owner content |
	self assert: stack top path isNotNil .
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
JinNSAbstractBuilder >> visitTable: aJinTable [

	| owner |
	self assert: stack top path isNotNil .
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
JinNSAbstractBuilder >> visitTableRelation: aJinTableRelation [ 

]

{ #category : #'as yet unclassified' }
JinNSAbstractBuilder >> visitedReferences [
	 self subclassResponsibility 
]
