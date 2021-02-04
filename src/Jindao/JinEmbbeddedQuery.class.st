Class {
	#name : #JinEmbbeddedQuery,
	#superclass : #Object,
	#instVars : [
		'sql'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #'as yet unclassified' }
JinEmbbeddedQuery >> allDependencies [
	^ {}
]

{ #category : #'as yet unclassified' }
JinEmbbeddedQuery >> sql: aString [ 
	sql := aString
]
