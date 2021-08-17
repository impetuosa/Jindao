Class {
	#name : #JinDAMAttribute,
	#superclass : #JinDAMVariable,
	#instVars : [
		'visibility',
		'accessors'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMAttribute >> accessors [
	 ^ accessors ifNil: [ accessors := OrderedCollection new  ]
]

{ #category : #adding }
JinDAMAttribute >> addAttributeAccessor: aJinDAMAttributeAccessor [ 
	self accessors add: aJinDAMAttributeAccessor 
]

{ #category : #'as yet unclassified' }
JinDAMAttribute >> attributeAccessors [

	^ accessors
]

{ #category : #accessing }
JinDAMAttribute >> visibility: aString [ 
	visibility := aString
]
