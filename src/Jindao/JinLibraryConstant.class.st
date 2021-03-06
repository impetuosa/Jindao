Class {
	#name : #JinLibraryConstant,
	#superclass : #JinLibraryAttribute,
	#instVars : [
		'value'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryConstant >> acceptVisitor: aVisitor [
 aVisitor visitLibraryConstant: self.

]

{ #category : #testing }
JinLibraryConstant >> isConstant [

	^ true
]

{ #category : #accessing }
JinLibraryConstant >> printOn: aStream [

	aStream
		nextPutAll: 'CONST(';
		nextPutAll: name;
		nextPutAll: '=';
		nextPutAll: value asString;
		nextPutAll: ')'
]

{ #category : #accessing }
JinLibraryConstant >> value [

	^ value
]

{ #category : #accessing }
JinLibraryConstant >> value: anObject [

	value := anObject
]
