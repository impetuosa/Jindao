Class {
	#name : #JinDAMUserType,
	#superclass : #JinDAMType,
	#instVars : [
		'attributes'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMUserType >> addAttribute: aJinDAMAttribute [ 
	self attributes add:aJinDAMAttribute
]

{ #category : #adding }
JinDAMUserType >> attributes [

	^ attributes ifNil: [ attributes := OrderedCollection new ]
]

{ #category : #adding }
JinDAMUserType >> find: aJinNSKind named: aString [

	aJinNSKind isAttribute ifTrue: [ 
		^ self attributes detect: [ :t | t name = aString ] ].
	^ self error: '??'
]

{ #category : #adding }
JinDAMUserType >> printOn: aStream [

	aStream
		nextPutAll: (self className copyReplaceAll: 'JinDAM' with: '');
		nextPutAll: ':';
		nextPutAll: name
]

{ #category : #adding }
JinDAMUserType >> relatedSymbolKind [

	^ #isType
]
