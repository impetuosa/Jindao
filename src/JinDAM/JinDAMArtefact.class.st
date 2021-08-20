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

{ #category : #adding }
JinDAMArtefact >> addGlobal: aJinDAMAttribute [
	self globals add: aJinDAMAttribute
]

{ #category : #adding }
JinDAMArtefact >> addType: aJinDAMPrimitiveType [
	types add: aJinDAMPrimitiveType
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
JinDAMArtefact >> name [
	^ name
]

{ #category : #accessing }
JinDAMArtefact >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinDAMArtefact >> path: aString [ 
	path := aString asFileReference 
]