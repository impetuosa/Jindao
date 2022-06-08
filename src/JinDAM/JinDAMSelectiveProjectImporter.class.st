Class {
	#name : #JinDAMSelectiveProjectImporter,
	#superclass : #JinDAMProjectImporter,
	#instVars : [
		'block'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> block: aBlock [

	block := aBlock
]

{ #category : #accessing }
JinDAMSelectiveProjectImporter >> new [

	^ self
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
