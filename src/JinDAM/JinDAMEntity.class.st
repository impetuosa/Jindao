Class {
	#name : #JinDAMEntity,
	#superclass : #Object,
	#instVars : [
		'anchor'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMEntity >> anchor [
	^ anchor
]

{ #category : #accessing }
JinDAMEntity >> anchor: jinAnchor [

	anchor := jinAnchor
]

{ #category : #'as yet unclassified' }
JinDAMEntity >> assert: aBool description: aDescription [

	aBool ifFalse: [ self halt: aDescription ]
]

{ #category : #testing }
JinDAMEntity >> isReadAccess [
	^ false 
]

{ #category : #testing }
JinDAMEntity >> isReference [
	 ^ false 
]

{ #category : #'as yet unclassified' }
JinDAMEntity >> relatedSymbolKind [

	^ #isAttribute
]
