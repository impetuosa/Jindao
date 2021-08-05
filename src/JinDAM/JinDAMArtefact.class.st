Class {
	#name : #JinDAMArtefact,
	#superclass : #JinDAMEntity,
	#instVars : [
		'name',
		'types',
		'globals'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMArtefact >> addType: aJinDAMPrimitiveType [
	types add: aJinDAMPrimitiveType
]

{ #category : #accessing }
JinDAMArtefact >> initialize [

	super initialize.
	types := OrderedCollection new
]

{ #category : #accessing }
JinDAMArtefact >> name: aString [ 
	name := aString
]
