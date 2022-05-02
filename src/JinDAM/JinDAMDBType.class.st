Class {
	#name : #JinDAMDBType,
	#superclass : #JinDAMType,
	#instVars : [
		'typeEnumReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMDBType >> = anOtherType [

	^ self class = anOtherType class and: [ name = anOtherType name ]
]

{ #category : #'as yet unclassified' }
JinDAMDBType >> accept: aVisitor [  
	^ aVisitor visitDBType: self.

]

{ #category : #'as yet unclassified' }
JinDAMDBType >> hash [

	^ name hash
]

{ #category : #accessing }
JinDAMDBType >> typeEnumReference [
	^ typeEnumReference
]

{ #category : #'as yet unclassified' }
JinDAMDBType >> typeEnumReference: aJinDAMTypeReference [

	typeEnumReference := aJinDAMTypeReference
]
