Class {
	#name : #JinDAMSelectiveProjectImporter,
	#superclass : #JinDAMProjectImporter,
	#instVars : [
		'block',
		'internalDependenciesBlock',
		'libReferences'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> accessReferences: aJinAccessProject [

	| parentsRefs |

	parentsRefs := projects allButFirst flatCollect: [ :r | 
		               r referencesAccess collect: #path ].

	^ aJinAccessProject referencesAccess reject: [ :ref | 
		  parentsRefs includes: ref path ]
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> block: aBlock [

	block := aBlock
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> initialize [

	super initialize.
	libReferences := OrderedCollection new
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> internalDependenciesBlock: aBlock [

	internalDependenciesBlock := aBlock
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> libReferences: aJinAccessProject [

	| parentsRefs |

	parentsRefs := projects allButFirst flatCollect: [ :r | 
		               r referencesLib collect: #path ].

	^ aJinAccessProject referencesLib reject: [ :ref | 
		  parentsRefs includes: ref path ]
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> loadInternalDependencies: aJinAccessProject [
	internalDependenciesBlock ifNil: [ ^ self ].
	self use: internalDependenciesBlock during: [ 
		self
			visitCollection: [ aJinAccessProject tables ]
			from: aJinAccessProject.
		self phaseFinished.
		self
			visitCollection: [ aJinAccessProject queries ]
			from: aJinAccessProject.
		self phaseFinished.
		self
			visitCollection: [ aJinAccessProject relations ]
			from: aJinAccessProject.
		self phaseFinished.
		self
			visitCollection: [ aJinAccessProject modules ]
			from: aJinAccessProject.
		self phaseFinished.
		self
			visitCollection: [ aJinAccessProject reports ]
			from: aJinAccessProject.
		self phaseFinished.
		self
			visitCollection: [ aJinAccessProject forms ]
			from: aJinAccessProject.
		self phaseFinished ]
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> new [

	^ self
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> use: aPredicate during: aBlock [

	| prev |
	prev := block.
	block := aPredicate.
	^ aBlock ensure: [ block := prev ]
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> visitCollection: aCollectionBlock [

	| size |
	size := aCollectionBlock value size.
	1 to: size do: [ :i | 
		(block value: (aCollectionBlock value at: i)) ifTrue: [ 
			(aCollectionBlock value at: i) acceptVisitor: self ] ]
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> visitCollection: aCollection from: project [

	| stackSize win32Error |
	
	stackSize := self state size.
	win32Error := false.
	1 to: aCollection value size do: [ :i | " Try to visit. If it fails it restarts the project and it does continue. If it fails twice it let the exception to go "
		[ 
		(block value: (aCollection value at: i)) ifTrue: [ 
			(aCollection value at: i) acceptVisitor: self ] ]
			on: Win32Error
			do: [ :e | win32Error := true ].
		win32Error ifTrue: [ 
			win32Error := false.
			self state size = stackSize ifFalse: [ "self halt: 'Umathching stacks!!'." 
				self state pop ].

			project reopen.
			(aCollection value at: i) acceptVisitor: self ] ]
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> visitProject: aJinAccessProject [

	| ret |
	projects push: aJinAccessProject.

	phase := 0.

	self state ifEmpty: [ 
		self state push: (self instantiate: JinDAMAccessModule) ].
	ret := self state top.


	self state top name: aJinAccessProject name.
	self state top anchor: (JinAnchor on: #/) / aJinAccessProject name.
	self state top addDependency: (self sdkLibrary).
	self state top path: aJinAccessProject projectPath fullName.

	processedReferences
		at: aJinAccessProject projectPath fullName asLowercase
		ifAbsentPut: [ self state top ].


		self visitCollection: [aJinAccessProject tables] from: aJinAccessProject.
	self phaseFinished.
	self visitCollection: [aJinAccessProject queries] from: aJinAccessProject.
	self phaseFinished.
	self visitCollection: [aJinAccessProject relations] from: aJinAccessProject.
	self phaseFinished.
self visitCollection: [aJinAccessProject modules] from: aJinAccessProject.
self phaseFinished.
	self visitCollection: [aJinAccessProject reports] from: aJinAccessProject.
	self phaseFinished.
		self visitCollection: [aJinAccessProject forms] from: aJinAccessProject.
	self phaseFinished.
	
	projects size = 1 ifTrue: [ 
		self loadInternalDependencies: aJinAccessProject.
		  ].
	self visitCollection: [ self accessReferences: aJinAccessProject ] from: aJinAccessProject.
	self visitCollection: [ self libReferences: aJinAccessProject  ] from: aJinAccessProject.

	
	self phaseFinished.

	projects pop.
	self assertIf: ret = self state top.



	^ ret
]
