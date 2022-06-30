Class {
	#name : #JinDAMTable,
	#superclass : #JinDAMDataSource,
	#instVars : [
		'indexes'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMTable >> accept: aVisitor [  
	^ aVisitor visitTable: self.

]

{ #category : #accessing }
JinDAMTable >> indexes [

	^ indexes ifNil: [ {  } ]
]

{ #category : #accessing }
JinDAMTable >> indexes: aCollection [ 
	indexes := aCollection
]

{ #category : #accessing }
JinDAMTable >> relatedSymbolKind [

	^ #isTable
]
