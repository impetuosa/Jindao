Class {
	#name : #JinDAMEntity,
	#superclass : #Object,
	#instVars : [
		'anchor'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMEntity >> acceptVisitor: aMOAlceModelReader [ 
	^ self accept:aMOAlceModelReader
]

{ #category : #accessing }
JinDAMEntity >> anchor [
	^ anchor
]

{ #category : #accessing }
JinDAMEntity >> anchor: jinAnchor [

	anchor := jinAnchor
]

{ #category : #accessing }
JinDAMEntity >> isAccessModule [

	^ false
]

{ #category : #accessing }
JinDAMEntity >> isArtefact [ 
 	 ^ false 
]

{ #category : #testing }
JinDAMEntity >> isAttributeGetter [
	 ^ false 
]

{ #category : #testing }
JinDAMEntity >> isInvocable [
	 ^ false 
]

{ #category : #testing }
JinDAMEntity >> isReadAccess [
	^ false 
]

{ #category : #testing }
JinDAMEntity >> isReference [
	 ^ false 
]

{ #category : #testing }
JinDAMEntity >> isType [
	^ false 
]

{ #category : #testing }
JinDAMEntity >> isTypeReference [
	^ false
]

{ #category : #testing }
JinDAMEntity >> isVariable [
	^ false 
]

{ #category : #accessing }
JinDAMEntity >> language [
	^ MOLanguage microsoftAccessForAlceModel: nil
]

{ #category : #'as yet unclassified' }
JinDAMEntity >> relatedSymbolKind [

	^ #isAttribute
]
