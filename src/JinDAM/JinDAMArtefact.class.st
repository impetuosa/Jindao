Class {
	#name : #JinDAMArtefact,
	#superclass : #JinDAMEntity,
	#instVars : [
		'name',
		'types',
		'globals',
		'path'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMArtefact >> accept: aVisitor [  
	^ aVisitor visitArtefact: self.

]

{ #category : #adding }
JinDAMArtefact >> addGlobal: aJinDAMAttribute [
	self globals add: aJinDAMAttribute
]

{ #category : #adding }
JinDAMArtefact >> addType: aJinDAMPrimitiveType [
	types add: aJinDAMPrimitiveType
]

{ #category : #accessing }
JinDAMArtefact >> findAttributeInvocable: aString amountArguments: anInteger [

	| privateName lcName |
	self assert: anInteger = 0.
	lcName := aString asLowercase copyReplaceAll: '$' with: ''.
	privateName := '_' , lcName.

	^ (types select: [ :t | t name asLowercase = lcName ]) ifEmpty: [ 
		  types select: [ :t | t name asLowercase = privateName ] ]
]

{ #category : #accessing }
JinDAMArtefact >> globals [
	^ globals ifNil: [  globals := OrderedCollection new  ]
]

{ #category : #accessing }
JinDAMArtefact >> initialize [

	super initialize.
	types := OrderedCollection new
]

{ #category : #accessing }
JinDAMArtefact >> isArtefact [ 
 	 ^ true 
]

{ #category : #accessing }
JinDAMArtefact >> name [
	^ name
]

{ #category : #accessing }
JinDAMArtefact >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinDAMArtefact >> path [

	^ path
]

{ #category : #accessing }
JinDAMArtefact >> path: aString [ 
	path := aString asFileReference 
]

{ #category : #adding }
JinDAMArtefact >> types [ 
	 ^ types 
]
