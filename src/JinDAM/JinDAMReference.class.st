Class {
	#name : #JinDAMReference,
	#superclass : #JinDAMEntity,
	#instVars : [
		'context',
		'candidate',
		'candidateAnchor'
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
JinDAMReference >> context [
	^ context
]

{ #category : #accessing }
JinDAMReference >> context: aJinDAMTypeReference [ 
	context := aJinDAMTypeReference
]

{ #category : #accessing }
JinDAMReference >> isReference [

	^ true
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
				 ifNotNil: [ candidate printString ]).
	
]
