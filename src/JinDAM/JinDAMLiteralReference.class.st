Class {
	#name : #JinDAMLiteralReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'name',
		'literalKind'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMLiteralReference >> literalKind: aString [

	literalKind := aString asSymbol
]

{ #category : #accessing }
JinDAMLiteralReference >> name [
	^ candidate asString 
]
