Class {
	#name : #JinDAMReference,
	#superclass : #JinDAMEntity,
	#instVars : [
		'context',
		'candidate',
		'candidateAnchor',
		'kindAccess'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMReference >> adaptToAlceAnchorPathFragment [

	| a segments |
	a := self.
	segments := OrderedCollection new.
	[ a isKindOf: JinDAMReference ] whileTrue: [ 
		segments addFirst: a name.
		a := a context ].
	^ '.' join: segments
]

{ #category : #accessing }
JinDAMReference >> candidate [
	^ candidate
]

{ #category : #accessing }
JinDAMReference >> candidate: aJinDAMPrimitiveType [ 
	self assert: candidate isNil. 
	candidate := aJinDAMPrimitiveType
]

{ #category : #accessing }
JinDAMReference >> candidateAnchor [

	^ candidateAnchor
]

{ #category : #accessing }
JinDAMReference >> candidateAnchor: aCandidateAnchor [
 	candidateAnchor := aCandidateAnchor. 
]

{ #category : #accessing }
JinDAMReference >> candidateType [

	^ candidate isCollection
		  ifTrue: [ candidate first type ]
		  ifFalse: [ candidate type ]
]

{ #category : #accessing }
JinDAMReference >> context [
	^ context
]

{ #category : #accessing }
JinDAMReference >> context: aJinDAMTypeReference [ 
	context := aJinDAMTypeReference
]

{ #category : #testing }
JinDAMReference >> isDictionaryAccess [

	^ (kindAccess compare: 'dictionary' caseSensitive: false) = 2
]

{ #category : #accessing }
JinDAMReference >> isReference [

	^ true
]

{ #category : #accessing }
JinDAMReference >> isTypeReference [

	^ false
]

{ #category : #accessing }
JinDAMReference >> kind [

	^ kindAccess
]

{ #category : #accessing }
JinDAMReference >> kind: aString [ 
	kindAccess := aString 
]

{ #category : #printing }
JinDAMReference >> printOn: aStream [

	aStream
		nextPutAll: ' -> ';
		nextPutAll: self adaptToAlceAnchorPathFragment;
		nextPutAll: ' ';
		nextPutAll:
			(candidate
				 ifNil: [ 'Unsolved' ]
				 ifNotNil: [ candidate name ]).
	
]
