Class {
	#name : #JinDAMUserType,
	#superclass : #JinDAMType,
	#instVars : [
		'attributes'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMUserType >> accept: aVisitor [  
	^ aVisitor visitUserType: self.

]

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

{ #category : #'as yet unclassified' }
JinDAMUserType >> findAttributeInvocable: aString amountArguments: amount [

	| fst snd noDollar |
	noDollar := aString copyReplaceAll: '$' with: ''.
	fst := (attributes ifNil: [ OrderedCollection new ]) select: [ :a | 
		       (a name compare: noDollar caseSensitive: false) = 2 ].
	fst size > 2 ifTrue: [ 
		snd := attributes select: [ :a | 
			       (a name compare: noDollar caseSensitive: false) = 2 and: [ 
				       a parametersSize = amount ] ].
		fst := (snd isNotEmpty and: [ snd size < fst size ])
			       ifTrue: [ snd ]
			       ifFalse: [ fst ] ].
	^ fst
		  ifEmpty: [ 
			  (attributes ifNil: [ OrderedCollection new ]) select: [ :a | 
				  (a name
					   compare: (noDollar copyReplaceAll: '_' with: ' ')
					   caseSensitive: false) = 2 ] ]
		  ifNotEmpty: [ fst ]
]

{ #category : #adding }
JinDAMUserType >> isFormOrReport [ 
	^ false 
]

{ #category : #adding }
JinDAMUserType >> isUserDefinedType [ 
	^ true
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
