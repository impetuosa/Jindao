"
I am an Access Module reference. 
I represent a reference to a microsoft access project which is used . 
"
Class {
	#name : #JinDAMAccessModule,
	#superclass : #JinDAMArtefact,
	#instVars : [
		'dependencies'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMAccessModule >> accept: aVisitor [  
	^ aVisitor visitAccessModule: self.

]

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

{ #category : #'as yet unclassified' }
JinDAMAccessModule >> isAccessModule [

	^ true
]

{ #category : #testing }
JinDAMAccessModule >> isVariable [
	^ true 
]

{ #category : #accessing }
JinDAMAccessModule >> name [

	| pieces |
	pieces := '.' split: name.
	^ pieces size > 1
		  ifTrue: [ pieces first ]
		  ifFalse: [ name ]
]

{ #category : #accessing }
JinDAMAccessModule >> printOn: aStream [

	aStream nextPutAll: 'AM ('.
	aStream
		nextPutAll: self name;
		nextPut: $)
]

{ #category : #'as yet unclassified' }
JinDAMAccessModule >> relatedSymbolKind [

	^ JinNSKind assembly
]

{ #category : #'as yet unclassified' }
JinDAMAccessModule >> tableRelations [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinDAMAccessModule >> vbaLang [
	 ^ self dependencies detect: [  :d |  d name = 'VBALang' ]
]
