Class {
	#name : #JinDAMQuery,
	#superclass : #JinDAMDataSource,
	#instVars : [
		'tables',
		'isUnnamed'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMQuery >> accept: aVisitor [  
	^ aVisitor visitQuery: self.

]

{ #category : #accessing }
JinDAMQuery >> isUnnamed: aBool [
	isUnnamed := aBool 
]

{ #category : #accessing }
JinDAMQuery >> relatedSymbolKind [

	^ #isQuery
]
