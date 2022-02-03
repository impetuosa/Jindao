Class {
	#name : #JinDAMAlias,
	#superclass : #JinDAMType,
	#instVars : [
		'typeReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMAlias >> accept: aVisitor [  
	^ aVisitor visitAlias: self.

]

{ #category : #testing }
JinDAMAlias >> find: aJinNSKind named: aString [

	^ typeReference candidate find: aJinNSKind named: aString
]

{ #category : #accessing }
JinDAMAlias >> findAttributeInvocable: aString amountArguments: amount [

	^ self type findAttributeInvocable: aString amountArguments: amount
]

{ #category : #accessing }
JinDAMAlias >> printOn: aStream [

	aStream
		nextPutAll: ' Alias ';
		nextPutAll: name;
		nextPutAll: ':'.
	typeReference printOn: aStream
]

{ #category : #accessing }
JinDAMAlias >> type [ 
	^ typeReference candidate 
]

{ #category : #accessing }
JinDAMAlias >> typeReference [
	^ typeReference
]

{ #category : #accessing }
JinDAMAlias >> typeReference: aJinDAMPrimitiveType [ 
	typeReference := aJinDAMPrimitiveType
]
