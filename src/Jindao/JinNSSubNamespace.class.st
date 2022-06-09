Class {
	#name : #JinNSSubNamespace,
	#superclass : #JinNSNamespace,
	#instVars : [
		'owner',
		'path'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #accessing }
JinNSSubNamespace >> acceptVisitor: aJinNSVisitorCounter [

	aJinNSVisitorCounter visitSubNamespace: self
]

{ #category : #description }
JinNSSubNamespace >> anchor [

	^ ((parent isNil or: [ tag isAssembly ])
		   ifTrue: [ (JinAnchor on: #/)  / name ]
		   ifFalse: [ parent anchor / self kind / name ]) 
]

{ #category : #accessing }
JinNSSubNamespace >> assembly [
	^ tag isAssembly ifTrue: [ self ] ifFalse: [ parent assembly ]
]

{ #category : #'as yet unclassified' }
JinNSSubNamespace >> containingSymbols [

	^ self kind isAssembly
		  ifFalse: [ { self } , parent containingSymbols ]
		  ifTrue: [ {  } ]
]

{ #category : #description }
JinNSSubNamespace >> kind [
 	^ tag
]

{ #category : #accessing }
JinNSSubNamespace >> kind: aJinNSKind [ 
	tag := aJinNSKind
]

{ #category : #accessing }
JinNSSubNamespace >> owner [
	^ owner
]

{ #category : #accessing }
JinNSSubNamespace >> owner: aJinNSEntryOwner [ 
	owner := aJinNSEntryOwner.
]

{ #category : #accessing }
JinNSSubNamespace >> path [
	^ path
]

{ #category : #accessing }
JinNSSubNamespace >> path: aPath [
	path := aPath 
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

{ #category : #'as yet unclassified' }
JinNSSubNamespace >> referersTo: aString [

	| lca lcb |
	lca := (name copyReplaceAll: '_' with: '') asLowercase.
	lcb := (aString copyReplaceAll: '_' with: '') asLowercase.
	^ lca = lcb
]
