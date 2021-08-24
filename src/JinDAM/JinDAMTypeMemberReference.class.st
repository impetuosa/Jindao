Class {
	#name : #JinDAMTypeMemberReference,
	#superclass : #JinDAMMemberReference,
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMTypeMemberReference >> addArgument: anArgument [ 
	self assert: name isNil. 
	name := anArgument.
]

{ #category : #adding }
JinDAMTypeMemberReference >> context: aContext [

	aContext candidate isNotNil
		ifTrue: [ self assert: aContext candidate isFormOrReport ]
		ifFalse: [ 
			self assert: ((aContext typeName beginsWith: 'Report_') or: [ 
					 aContext typeName beginsWith: 'Form_' ]) ].
	super context: aContext
]

{ #category : #adding }
JinDAMTypeMemberReference >> name [

	^ name ifNotNil: [ name text ]
]
