Class {
	#name : #JinDAMLibrary,
	#superclass : #JinDAMArtefact,
	#instVars : [
		'isBuiltIn',
		'invocables'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMLibrary >> accept: aVisitor [  
	^ aVisitor visitLibrary: self.

]

{ #category : #adding }
JinDAMLibrary >> addInvocable: aJinDAMFunction [

	self invocables add: aJinDAMFunction
]

{ #category : #testing }
JinDAMLibrary >> find: aJinNSKind named: aString [

	| lc |
	lc := aString asLowercase.
	aJinNSKind isInvocable ifTrue: [ 
		^ invocables detect: [ :t | t selector asLowercase = lc ] ].
	aJinNSKind isType ifTrue: [ 
		^ types detect: [ :t | t name asLowercase = lc ] ].
	aJinNSKind isAttribute ifTrue: [ 
		^ self globals detect: [ :t | 
			  t name asLowercase = aString asLowercase ] ].
	^ self error: '??'
]

{ #category : #accessing }
JinDAMLibrary >> invocables [
	^ invocables ifNil: [ invocables := OrderedCollection new  ]
]

{ #category : #testing }
JinDAMLibrary >> isBuiltIn: aBoolean [

	isBuiltIn := aBoolean
]

{ #category : #testing }
JinDAMLibrary >> isVariable [
	 ^ true
]

{ #category : #testing }
JinDAMLibrary >> printOn: aStream [

	aStream nextPutAll: 'Lib ('.
	aStream
		nextPutAll: name;
		nextPut: $)
]

{ #category : #testing }
JinDAMLibrary >> relatedSymbolKind [

	^ #isAssembly
]
