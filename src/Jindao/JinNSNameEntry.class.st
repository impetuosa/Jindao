Class {
	#name : #JinNSNameEntry,
	#superclass : #Object,
	#instVars : [
		'name',
		'owner',
		'kind'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #accessing }
JinNSNameEntry >> kind: aJinNSKind [ 
	kind := aJinNSKind
]

{ #category : #accessing }
JinNSNameEntry >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinNSNameEntry >> owner: aJinNSEntryOwner [ 
	owner := aJinNSEntryOwner
]

{ #category : #accessing }
JinNSNameEntry >> printOn: aStream [

	aStream
		nextPutAll: name;
		nextPutAll: ':'.
	kind printOn: aStream.
	aStream nextPutAll: '::'.
	owner printOn: aStream
]
