Class {
	#name : #FuRename,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'newName',
		'applied',
		'hasModule',
		'content'
	],
	#category : #'Jindao-FuZhi'
}

{ #category : #'as yet unclassified' }
FuRename class >> object: aModelObject to: aName [
	^ self new
		name: aModelObject name;
		type: aModelObject typeNumber;
		newName: aName;
		yourself
]

{ #category : #'as yet unclassified' }
FuRename class >> object: aModelObject to: aName hasModule: aBoolean moduleContents: aContent [
	^ self new
		name: aModelObject name;
		type: aModelObject typeNumber;
		newName: aName;
		hasModule: aBoolean;
		moduleContent: aContent;
		yourself
]

{ #category : #applying }
FuRename >> applyOn: aProject [
	| obj |
	applied
		ifTrue: [ ^ self ].
	content
		=
			'Option Compare Database
'
		ifTrue: [ content := '
Option Compare Database
Option Explicit 
' ].
	obj := (type = JinForm typeNumber
		ifTrue: [ aProject forms ]
		ifFalse: [ aProject reports ]) detect: [ :o | o name = name ].
	obj module code insertLines: content.
	obj save.
	obj close.
	aProject application compileAll. 	
	aProject application rename: name typeNumber: type with: newName.
	obj := (type = JinForm typeNumber
		ifTrue: [ aProject forms ]
		ifFalse: [ aProject reports ]) detect: [ :o | o name = newName ].
	hasModule
		ifFalse: [ obj hasModule: false.
			obj closeAndSave ].
	obj close.
	applied := true
]

{ #category : #'as yet unclassified' }
FuRename >> content [
	^ content
]

{ #category : #accessing }
FuRename >> hasModule: aBoolean [
	hasModule := aBoolean
]

{ #category : #applying }
FuRename >> initialize [
	super initialize.
	applied := false
]

{ #category : #accessing }
FuRename >> moduleContent: aContent [
	content := aContent
]

{ #category : #accessing }
FuRename >> name [
	^ name
]

{ #category : #accessing }
FuRename >> name: anObject [
	name := anObject
]

{ #category : #accessing }
FuRename >> newName [
	^ newName
]

{ #category : #accessing }
FuRename >> newName: anObject [
	newName := anObject
]

{ #category : #accessing }
FuRename >> type [
	^ type
]

{ #category : #accessing }
FuRename >> type: anObject [
	type := anObject
]
