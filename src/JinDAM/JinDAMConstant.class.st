Class {
	#name : #JinDAMConstant,
	#superclass : #JinDAMVariable,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMConstant >> accept: aVisitor [  
	^ aVisitor visitConstant: self.

]

{ #category : #adding }
JinDAMConstant >> addAccess: aJinDAMAccessRead [

	initializer ifNil: [ 
		initializer := aJinDAMAccessRead.
		^ self ].
	initializer isCollection ifFalse: [ 
		initializer := OrderedCollection new
			               add: initializer;
			               yourself ].
	initializer add: aJinDAMAccessRead
]

{ #category : #adding }
JinDAMConstant >> value [ 
	 ^ initializer 
]
