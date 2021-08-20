Class {
	#name : #JinDAMAccessModule,
	#superclass : #JinDAMArtefact,
	#instVars : [
		'dependencies'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMAccessModule >> addDependency: aJinDAMLibrary [

	self dependencies add: aJinDAMLibrary
]

{ #category : #adding }
JinDAMAccessModule >> addReference: aJinDAMLibrary [

	self dependencies add: aJinDAMLibrary
]

{ #category : #accessing }
JinDAMAccessModule >> dependencies [
	^ dependencies ifNil: [ dependencies := OrderedCollection new  ]
]

{ #category : #'as yet unclassified' }
JinDAMAccessModule >> find: aJinNSKind named: aString [

	| lc |
	lc := aString asLowercase.
 
	aJinNSKind isType ifTrue: [ 
		^ types
			  detect: [ :t | t name asLowercase = lc and: [ aJinNSKind compatibleWith: t relatedSymbolKind  ]  ]
			  ifNone: [ self vbaLang find: aJinNSKind named: aString ] ].
	aJinNSKind isAttribute ifTrue: [ 
		^ self globals
			  detect: [ :t | t name asLowercase = lc ]
			  ifNone: [ self vbaLang find: aJinNSKind named: aString ] ].
	^ self error: '??'
]

{ #category : #accessing }
JinDAMAccessModule >> printOn: aStream [

	aStream nextPutAll: 'AM ('.
	aStream
		nextPutAll: name;
		nextPut: $)
]

{ #category : #'as yet unclassified' }
JinDAMAccessModule >> relatedSymbolKind [

	^ JinNSKind assembly
]

{ #category : #'as yet unclassified' }
JinDAMAccessModule >> vbaLang [
	 ^ self dependencies detect: [  :d |  d name = 'VBALang' ]
]