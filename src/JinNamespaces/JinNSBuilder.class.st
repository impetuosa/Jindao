Class {
	#name : #JinNSBuilder,
	#superclass : #JinNSAbstractBuilder,
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
	#category : #JinNamespaces
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

{ #category : #'as yet unclassified' }
JinNSBuilder >> assemblyNamespaces [

	^ assemblyNamespaces
]

{ #category : #initialization }
JinNSBuilder >> buildFor: anAccessProject [


	(self visitedReferences includes:
		 anAccessProject path fullName asLowercase) ifFalse: [ 
		stack push: (self newExternalNamespaceFor: anAccessProject).
		stack push: (self
				 newAssemblyNamespace: anAccessProject
				 owner: (self typeOwnerFor: anAccessProject)).
		visitedReferences add: anAccessProject path fullName asLowercase.
		anAccessProject acceptVisitor: self.

		self joinFutures.
		self checkTasksSanity ].
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

{ #category : #'as yet unclassified' }
JinNSBuilder >> externalNamespaces [

	^ externalNamespaces
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
JinNSBuilder >> visitedReferences [

	^ visitedReferences
]
