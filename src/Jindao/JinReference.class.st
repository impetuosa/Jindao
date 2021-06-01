"
I represent a static dependency of a project .


"
Class {
	#name : #JinReference,
	#superclass : #JinAccessObject,
	#instVars : [
		'library'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinReference >> acceptVisitor: aVisitor [ 
	aVisitor visitReference: self 
]

{ #category : #'as yet unclassified' }
JinReference >> guid [
	^ handle propertyNamed: #Guid
]

{ #category : #testing }
JinReference >> isAccessProject [

	^ self path extension asLowercase beginsWith: 'accd'
]

{ #category : #'as yet unclassified' }
JinReference >> isBroken [
	^ handle propertyNamed: #IsBroken
]

{ #category : #'as yet unclassified' }
JinReference >> isBuiltIn [
	^ handle propertyNamed: #BuiltIn
]

{ #category : #testing }
JinReference >> isLibrary [
	^ self isAccessProject not 
]

{ #category : #accessing }
JinReference >> library [

	^ library ifNil: [ 
		  library := JinLibrary new
			             reference: self;
			             yourself ]
]

{ #category : #'as yet unclassified' }
JinReference >> major [
	^ handle propertyNamed: #Major
]

{ #category : #'as yet unclassified' }
JinReference >> minor [
	^ handle propertyNamed: #Minor
]

{ #category : #'as yet unclassified' }
JinReference >> path [
	^ (handle propertyNamed: #FullPath) asFileReference
]

{ #category : #'as yet unclassified' }
JinReference >> printOn: aStream [
	aStream
		nextPutAll: 'Ref[';
		nextPutAll: self name;
		nextPutAll: '|';
		nextPutAll: self major asString;
		nextPut: $.;
		nextPutAll: self minor asString;
		nextPutAll:
			(self isBroken
				ifTrue: [ 'BROKEN]' ]
				ifFalse: [ ']' ])
]
