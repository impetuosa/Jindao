Class {
	#name : #JinDAMPrimitiveType,
	#superclass : #JinDAMType,
	#category : #'JinDAM-Model'
}

{ #category : #printing }
JinDAMPrimitiveType >> = anOtherType [

	^ self class = anOtherType class and: [ name = anOtherType name ]
]

{ #category : #'as yet unclassified' }
JinDAMPrimitiveType >> accept: aVisitor [  
	^ aVisitor visitPrimitiveType: self.

]

{ #category : #printing }
JinDAMPrimitiveType >> hash [

	^ name hash
]

{ #category : #printing }
JinDAMPrimitiveType >> printOn: aStream [

	aStream
		nextPutAll: 'PrimitiveType:';
		nextPutAll: name
]
