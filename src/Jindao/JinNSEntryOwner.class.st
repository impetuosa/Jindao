Class {
	#name : #JinNSEntryOwner,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'contentHash'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #accessing }
JinNSEntryOwner >> contentHash: aString [ 
	contentHash := aString
]

{ #category : #accessing }
JinNSEntryOwner >> name [

	^ name
]

{ #category : #accessing }
JinNSEntryOwner >> name: aString [ 
	 aString = 'Access9.0' ifTrue:[self halt ]. 
	name := aString
]

{ #category : #accessing }
JinNSEntryOwner >> printOn: aStream [

	aStream
		nextPutAll: name;
		nextPutAll: '(';
		nextPutAll: contentHash asString ;
		nextPutAll: ')'
]

{ #category : #'as yet unclassified' }
JinNSEntryOwner >> simpleName [

	^ ('.' split: name) last
]

{ #category : #accessing }
JinNSEntryOwner >> type [
	^ type
]

{ #category : #accessing }
JinNSEntryOwner >> type: aClass [ 
	type := aClass
]
