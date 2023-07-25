"
Entry owner defines, within the context where the entry has been registered, which sub contect is the owner. 

For example, a static public method is visible at any level, however, its owner is the class where it has been defined. 

The owner denotes not only structural information as name, assembly where it belongs, and kind, but also a contentHash. 

This content hash allows to learn if symbol should or not being re-registered. 
"
Class {
	#name : #JinNSEntryOwner,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'contentHash'
	],
	#category : #'JinNamespaces-Model'
}

{ #category : #accessing }
JinNSEntryOwner >> assembly [
	self shouldBeImplemented.
]

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
