Class {
	#name : #JinDAMTable,
	#superclass : #JinDAMDataSource,
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMTable >> accept: aVisitor [  
	^ aVisitor visitTable: self.

]

{ #category : #accessing }
JinDAMTable >> relatedSymbolKind [

	^ #isTable
]
