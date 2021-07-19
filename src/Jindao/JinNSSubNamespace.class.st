Class {
	#name : #JinNSSubNamespace,
	#superclass : #JinNSNamespace,
	#instVars : [
		'owner'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #accessing }
JinNSSubNamespace >> kind: aJinNSKind [ 
	tag := aJinNSKind
]

{ #category : #accessing }
JinNSSubNamespace >> owner: aJinNSEntryOwner [ 
	owner := aJinNSEntryOwner
]

{ #category : #accessing }
JinNSSubNamespace >> printOn: aStream [

	aStream
		nextPutAll: name;
		nextPutAll: ':'.
	tag printOn: aStream.
	aStream nextPutAll: '::'.
	owner printOn: aStream.
	aStream
		nextPutAll: '(#';
		nextPutAll:
			(entries ifNil: [ 0 ] ifNotNil: [ entries size ]) asString;
		nextPutAll: ')'
]
