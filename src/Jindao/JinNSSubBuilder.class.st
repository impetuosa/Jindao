Class {
	#name : #JinNSSubBuilder,
	#superclass : #JinNSAbstractBuilder,
	#instVars : [
		'parent'
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
			 newAssemblyNamespace: anAccessProject
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
JinNSSubBuilder >> subbuildFor: project builder: aMainBuilder [

	parent := aMainBuilder.
	self buildFor: project
]
