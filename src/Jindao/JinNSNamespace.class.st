"
There are Five levels of namespace in VBA: 

Export (the things that are accessible externally from an assembly)
Assembly (The configuration of a single VBA project) 
Reference (AccessModule / Library)
Type (class, module, table, etc).
Method / Function / Producedure.


"
Class {
	#name : #JinNSNamespace,
	#superclass : #Object,
	#instVars : [
		'parent',
		'names',
		'tag',
		'name',
		'entries',
		'entriesMutex',
		'friends'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #visiting }
JinNSNamespace >> acceptVisitor: aJinNSVisitorCounter [

	aJinNSVisitorCounter visitNamespace: self
]

{ #category : #accessing }
JinNSNamespace >> count [

	^ (JinNSVisitorCounter new count: self) count
]

{ #category : #'as yet unclassified' }
JinNSNamespace >> entriesHolderFor: aString [

	| col |
	self modifyEntriesWith: [ :e | 
		e at: aString ifPresent: [ :c | col := c ] ifAbsent: [ 
			col := JinSharedCollection new.
			e at: aString put: col ] ].
	^ col
]

{ #category : #'as yet unclassified' }
JinNSNamespace >> entriesHoldersFor: aStringOrderedCollection [

	| col |
	self modifyEntriesWith: [ :entr | 
		col := aStringOrderedCollection collect: [ :s | 
			       entr at: s ifAbsentPut: JinSharedCollection new ] ].

	^ col
]

{ #category : #'as yet unclassified' }
JinNSNamespace >> initialize [ 
	 super initialize.
	entries := Dictionary new. 
	friends := Set new. 
]

{ #category : #accessing }
JinNSNamespace >> installAllAssemblySymbolsFrom: anOtherNS [
	 friends add: anOtherNS
]

{ #category : #accessing }
JinNSNamespace >> modifyEntriesWith: aBlock [

	entriesMutex ifNil: [ entriesMutex := Mutex new ].
	entriesMutex critical: [ aBlock value: entries ]
]

{ #category : #accessing }
JinNSNamespace >> name [
	^ name
]

{ #category : #accessing }
JinNSNamespace >> name: aString [ 
	 name := aString  
]

{ #category : #accessing }
JinNSNamespace >> parent: aJinNSNamespace [ 
	parent := aJinNSNamespace
]

{ #category : #accessing }
JinNSNamespace >> printOn: aStream [

	aStream
		nextPutAll: 'NS ';
		nextPutAll: tag;
		nextPutAll: ' ';
		nextPutAll: name;
		nextPutAll: '(';
		nextPutAll: entries size asString;
		nextPutAll: ')'
]

{ #category : #'as yet unclassified' }
JinNSNamespace >> readEntries [

	^ entries values flatCollect: #yourself
]

{ #category : #'as yet unclassified' }
JinNSNamespace >> register: aString kind: aJinNSKind owner: aJinNSEntryOwner [

	(self entriesHolderFor: aString) add: (JinNSNameEntry new
			 name: aString;
			 kind: aJinNSKind;
			 owner: aJinNSEntryOwner;
			 yourself)
]

{ #category : #'as yet unclassified' }
JinNSNamespace >> registerAll: aStringOrderedCollection kind: aJinNSKind owner: aJinNSEntryOwner [

	| col |
	col := self entriesHoldersFor: aStringOrderedCollection.
	col with: aStringOrderedCollection do: [ :holder :aString | 
		holder add: (JinNSNameEntry new
				 name: aString;
				 kind: aJinNSKind;
				 owner: aJinNSEntryOwner;
				 yourself) ]
]

{ #category : #'as yet unclassified' }
JinNSNamespace >> registerSubNamespace: aString kind: aJinNSKind owner: aJinNSEntryOwner [

	| ns |
	ns := JinNSSubNamespace new
		      name: aString;
		      kind: aJinNSKind;
		      owner: aJinNSEntryOwner;
		      parent: self;
		      yourself.

	(self entriesHolderFor: aString) add: ns.
	^ ns
]

{ #category : #accessing }
JinNSNamespace >> tag [
	^ tag
]

{ #category : #accessing }
JinNSNamespace >> tag: aString [ 
	tag := aString
]
