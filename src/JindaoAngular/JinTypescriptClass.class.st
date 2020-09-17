Class {
	#name : #JinTypescriptClass,
	#superclass : #JinTypescriptObject,
	#instVars : [
		'types',
		'methods',
		'superclass',
		'properties',
		'decorator'
	],
	#classInstVars : [
		'object'
	],
	#category : #JindaoAngular
}

{ #category : #accessing }
JinTypescriptClass class >> object [

	^ object ifNil: [ 
		  object := JinTypescriptClass new
			            name: #Object;
			            yourself ]
]

{ #category : #adding }
JinTypescriptClass >> addMethod: aJinTypescriptMethod [ 
	methods  add: aJinTypescriptMethod .
	aJinTypescriptMethod setOwnerClass: self . 
]

{ #category : #accessing }
JinTypescriptClass >> decorator [

	^ decorator
]

{ #category : #accessing }
JinTypescriptClass >> decorator: aDeco [

	decorator := aDeco
]

{ #category : #generated }
JinTypescriptClass >> implements: aCollection [ 
	types := aCollection 
]

{ #category : #generated }
JinTypescriptClass >> initialize [ 
	super initialize .
	methods := OrderedCollection new .
	properties := OrderedCollection new. 
]

{ #category : #accessing }
JinTypescriptClass >> methods [
	^ methods
]

{ #category : #accessing }
JinTypescriptClass >> parents [
	self shouldBeImplemented.
]

{ #category : #accessing }
JinTypescriptClass >> properties [
	^ properties 
]

{ #category : #accessing }
JinTypescriptClass >> superclass [

	^ superclass ifNil: [ superclass := self class object  ]
]

{ #category : #accessing }
JinTypescriptClass >> types [
	^ types
]
