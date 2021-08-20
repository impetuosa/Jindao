Class {
	#name : #JinDAMQuery,
	#superclass : #JinDAMDataSource,
	#instVars : [
		'tables'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMQuery >> relatedSymbolKind [

	^ #isQuery
]
