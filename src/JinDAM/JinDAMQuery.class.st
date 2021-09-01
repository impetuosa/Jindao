Class {
	#name : #JinDAMQuery,
	#superclass : #JinDAMDataSource,
	#instVars : [
		'tables'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMQuery >> accept: aVisitor [  
	^ aVisitor visitQuery: self.

]

{ #category : #accessing }
JinDAMQuery >> relatedSymbolKind [

	^ #isQuery
]
