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
