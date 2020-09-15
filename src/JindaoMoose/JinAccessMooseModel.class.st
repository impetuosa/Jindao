Class {
	#name : #JinAccessMooseModel,
	#superclass : #Object,
	#instVars : [
		'project',
		'path',
		'parent',
		'entities'
	],
	#category : #JindaoMoose
}

{ #category : #MooseCompatibility }
JinAccessMooseModel class >> initialize [ 
	SessionManager default registerSystemClassNamed: self name.
]

{ #category : #MooseCompatibility }
JinAccessMooseModel class >> mooseName [
	^ 'Access'
]

{ #category : #MooseCompatibility }
JinAccessMooseModel class >> shutdown: isImageQuitting [
	isImageQuitting ifTrue: [  self allInstancesDo: [ : m | m ensureClosed ] ].
]

{ #category : #MooseCompatibility }
JinAccessMooseModel class >> startup: isImageStarting [

]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> allDeclaredPropertiesIn: aMetamodel [
	self halt 
]

{ #category : #'initialize-release' }
JinAccessMooseModel >> closeAndQuit [

	[ project closeAndQuit ]
		on: Win32Error
		do: [ :e | e passIfNotError0x80020009 ]
]

{ #category : #MooseGroupCompatibility }
JinAccessMooseModel >> collect: aFullBlockClosure [

	^ self entities collect: aFullBlockClosure
]

{ #category : #MooseGroupCompatibility }
JinAccessMooseModel >> ensureClosed [

	project ifNotNil: [ 
		entities := nil. 
		project closeAndQuit.
		project := nil ]
]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> entities [

	^ entities ifNil: [ entities := (self project forms collect: #yourself)
	  , (self project reports collect: #yourself)
	  , (self project tables collect: #yourself)
	  , (self project queries collect: #yourself)
	  , (self project macros collect: #yourself)]
]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> isMooseModel [

	^ true
]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> isMooseObject [
	 ^ true 
]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> isOfType: aClass [
	^ true
]

{ #category : #accessing }
JinAccessMooseModel >> isOpen [
	^ project isNotNil
]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> mooseModel [
	^ parent
]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> mooseName [
	^ self name
]

{ #category : #accessing }
JinAccessMooseModel >> name [ 
	^ path basename  
]

{ #category : #accessing }
JinAccessMooseModel >> open [

	project
		ifNil: [ project := JinAccessApplication default open: path ]
		ifNotNil: [ self error: 'The project is already open' ]
]

{ #category : #accessing }
JinAccessMooseModel >> path: aPath [

	path := aPath
]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> privateSetMooseModel: aMooseModel [ 
	parent := aMooseModel 
]

{ #category : #accessing }
JinAccessMooseModel >> project [

	^ self isOpen
		  ifTrue: [ project ]
		  ifFalse: [ self open. project ]
]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> proxifiedEntities [


	^ (self project forms collect: [: o| JinPath object: o obtainedBySending: (Message selector:#__NOT_POSSIBLE_TO_RECOVER) to: JinPath  ])
	  , (self project reports collect: [: o| JinPath object: o obtainedBySending: (Message selector:#__NOT_POSSIBLE_TO_RECOVER) to: JinPath  ])
	  , (self project tables collect: [: o| JinPath object: o obtainedBySending: (Message selector:#__NOT_POSSIBLE_TO_RECOVER) to: JinPath  ])
	  , (self project queries collect: [: o| JinPath object: o obtainedBySending: (Message selector:#__NOT_POSSIBLE_TO_RECOVER) to: JinPath  ]),
	(self project macros collect: [: o| JinPath object: o obtainedBySending: (Message selector:#__NOT_POSSIBLE_TO_RECOVER) to: JinPath  ])
]

{ #category : #MooseCompatibility }
JinAccessMooseModel >> rootsForTreeMap [

	^ self entities
]
