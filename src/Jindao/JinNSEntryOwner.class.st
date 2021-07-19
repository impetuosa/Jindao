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
	name := aString
]

{ #category : #accessing }
JinNSEntryOwner >> printOn: aStream [

	aStream
		nextPutAll: name;
		nextPutAll: '(';
		nextPutAll: contentHash;
		nextPutAll: ')'
]

{ #category : #accessing }
JinNSEntryOwner >> type: aClass [ 
	type := aClass
]
