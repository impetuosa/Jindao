Class {
	#name : #JinNSSubBuilder,
	#superclass : #JinNSAbstractBuilder,
	#instVars : [
		'parent',
		'reference'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #visiting }
JinNSSubBuilder >> addFuture: aFuture [

	parent addFuture: aFuture
]

{ #category : #visiting }
JinNSSubBuilder >> addFutures: someFutures [

	parent addFutures: someFutures
]

{ #category : #'as yet unclassified' }
JinNSSubBuilder >> assemblyNamespaces [
	 ^ parent assemblyNamespaces
]

{ #category : #visiting }
JinNSSubBuilder >> buildFor: anAccessProject [

	stack push: self externalNamespaces first.
	stack push: (self
			 newAssemblyNamespace: reference 
			 owner: (self typeOwnerFor: anAccessProject)).
	parent visitedReferences add:
		anAccessProject path fullName asLowercase.
	anAccessProject acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinNSSubBuilder >> externalNamespaces [

	^ parent externalNamespaces
]

{ #category : #'as yet unclassified' }
JinNSSubBuilder >> subbuildFor: project builder: aMainBuilder reference: aReference [ 

	parent := aMainBuilder.
	reference := aReference.
	self buildFor: project
]

{ #category : #'as yet unclassified' }
JinNSSubBuilder >> visitReference: aJinReference [

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

{ #category : #'as yet unclassified' }
JinNSSubBuilder >> visitedReferences [

	^ parent visitedReferences
]
