Class {
	#name : #JinNSNameEntry,
	#superclass : #Object,
	#instVars : [
		'parent',
		'name',
		'owner',
		'kind'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #visiting }
JinNSNameEntry >> acceptVisitor: aJinNSVisitorCounter [

	aJinNSVisitorCounter visitNameEntry: self
]

{ #category : #accessing }
JinNSNameEntry >> anchor [
	 ^ nil 
]

{ #category : #'as yet unclassified' }
JinNSNameEntry >> findSymbol: aString [

	^ (name compare: aString caseSensitive: false) = 2
		  ifTrue: [ { self } ]
		  ifFalse: [ {  } ]
]

{ #category : #accessing }
JinNSNameEntry >> kind [
	^ kind
]

{ #category : #accessing }
JinNSNameEntry >> kind: aJinNSKind [ 
	kind := aJinNSKind
]

{ #category : #accessing }
JinNSNameEntry >> name [
	^ name
]

{ #category : #accessing }
JinNSNameEntry >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinNSNameEntry >> owner [
	^ owner
]

{ #category : #accessing }
JinNSNameEntry >> owner: aJinNSEntryOwner [
	owner := aJinNSEntryOwner.
]

{ #category : #accessing }
JinNSNameEntry >> parent: aParent [ 
	 parent := aParent 
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

{ #category : #'as yet unclassified' }
JinNSNameEntry >> referersTo: aString [ 
	^ name asLowercase = aString asLowercase 
]
