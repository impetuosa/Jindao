Class {
	#name : #JinDAMAttribute,
	#superclass : #JinDAMVariable,
	#instVars : [
		'visibility',
		'accessors',
		'isStatic'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMAttribute >> accept: aVisitor [  
	^ aVisitor visitAttribute: self.

]

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

{ #category : #'as yet unclassified' }
JinDAMAttribute >> isStatic: aBool [

	isStatic := aBool
]

{ #category : #accessing }
JinDAMAttribute >> visibility [
	^ visibility ifNil: [ #Public ]
]

{ #category : #accessing }
JinDAMAttribute >> visibility: aString [ 
	visibility := aString
]
