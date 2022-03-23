Class {
	#name : #JinDAMObject,
	#superclass : #Object,
	#instVars : [
		'type',
		'state'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMObject >> objectEntryFor: aJinDAMAttribute [

	| obj |
	obj := self class new.
	obj type: aJinDAMAttribute.
	self state at: aJinDAMAttribute name put: obj.
	^ obj
]

{ #category : #'as yet unclassified' }
JinDAMObject >> propertyEntryFor: aJinAccessFormFastProperty [

	self state
		at: aJinAccessFormFastProperty name
		put: ([ aJinAccessFormFastProperty value ]
				 on: Error
				 do: [ nil ])
]

{ #category : #accessing }
JinDAMObject >> state [

	^ state ifNil: [ state := Dictionary new ]
]

{ #category : #accessing }
JinDAMObject >> type [

	^ type
]

{ #category : #accessing }
JinDAMObject >> type: anEntity [

	type := anEntity
]
