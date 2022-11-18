Class {
	#name : #JinDAMProjectImporter,
	#superclass : #JinProjectVisitor,
	#instVars : [
		'phase',
		'processedReferences',
		'projects',
		'savingPhases'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #'visit-first-objects' }
JinDAMProjectImporter >> assertIf: abool [ 
	self assert: abool
]

{ #category : #'visit-first-objects' }
JinDAMProjectImporter >> assertStackSize: stackSize [

	self haltIf: (self state size = stackSize) not
]

{ #category : #'visit-first-objects' }
JinDAMProjectImporter >> initialize [

	super initialize.
	processedReferences := Dictionary new.
	projects := Stack new.
]

{ #category : #'visit-first-objects' }
JinDAMProjectImporter >> phaseFinished [

	phase := phase + 1.
	self savingPhases ifTrue: [ 
		Smalltalk saveAs:
			Smalltalk changesFile basenameWithoutExtension , '.'
			, phase asString.
		projects top reopen ]
]

{ #category : #accessing }
JinDAMProjectImporter >> projects [
	^ projects
]

{ #category : #'instance creation' }
JinDAMProjectImporter >> savingPhases [

	^ savingPhases ifNil: [ false ]
]

{ #category : #'visit-first-objects' }
JinDAMProjectImporter >> visitCollection: aCollectionBlock [

	| size |
	size := aCollectionBlock value size.
	1 to: size do: [ :i | (aCollectionBlock value at: i) acceptVisitor: self ].
]

{ #category : #'visit-first-objects' }
JinDAMProjectImporter >> visitCollection: aCollection from: project [

	| stackSize win32Error |
	stackSize := self state size.
	win32Error := false.
	1 to: aCollection value size do: [ :i | " Try to visit. If it fails it restarts the project and it does continue. If it fails twice it let the exception to go "
		[ (aCollection value at: i) acceptVisitor: self ]
			on: Win32Error
			do: [ :e | win32Error := true ].
		win32Error ifTrue: [ 
			win32Error := false.
			self state size = stackSize ifFalse: [ self state pop ].
			self assertStackSize: stackSize.
			project reopen.
			(aCollection value at: i) acceptVisitor: self ] ]
]

{ #category : #'visit-first-objects' }
JinDAMProjectImporter >> visitProject: aJinAccessProject [

	| ret |
	projects push: aJinAccessProject.

	phase := 0.

	self state ifEmpty: [ 
		self state push: (self instantiate: JinDAMAccessModule) ].
	ret := self state top.


	self state top name: aJinAccessProject name.
	self state top anchor: (JinAnchor on: #/) / aJinAccessProject name.
	self state top addDependency: self sdkLibrary.
	self state top path: aJinAccessProject projectPath fullName.

	processedReferences
		at: aJinAccessProject projectPath fullName asLowercase
		ifAbsentPut: [ self state top ].
	[ 
		self visitCollection: [aJinAccessProject tables] from: aJinAccessProject.
	self phaseFinished.
	self visitCollection: [aJinAccessProject queries] from: aJinAccessProject.
	self phaseFinished.
	self visitCollection: [aJinAccessProject relations] from: aJinAccessProject.
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
	self phaseFinished.

	self
		visitCollection: [ aJinAccessProject references ]
		from: aJinAccessProject.
	self phaseFinished




	"self visitCollection: [aJinAccessProject macros] from: aJinAccessProject.
self phaseFinished." ] 
		ensure: [ projects pop ].
	self assertIf: ret = self state top.



	^ ret
]

{ #category : #'visit-first-objects' }
JinDAMProjectImporter >> visitReference: aJinReference [

	| ref |

	processedReferences
		at: aJinReference path fullName asLowercase
		ifPresent: [ :a | 
			self state top addReference: a.
			^ self ].

	aJinReference isAccessProject
		ifTrue: [ ref := self instantiate: JinDAMAccessModule ]
		ifFalse: [ 
			ref := self instantiate: JinDAMLibrary.
			ref isBuiltIn: aJinReference isBuiltIn ].

	processedReferences
		at: aJinReference path fullName asLowercase
		put: ref.

	ref anchor: self state top anchor / #references / aJinReference name.
	ref path: aJinReference path fullName.
	ref name: aJinReference name.
	self state top addReference: ref.
	self state push: ref.
	aJinReference isAccessProject
		ifTrue: [ 
			self referenceAccess ifNotNil: [ :r | 
				r visitReference: aJinReference ] ]
		ifFalse: [ 
			self referenceLibrary ifNotNil: [ :r | 
				r visitReference: aJinReference ] ].
	self state pop
]
