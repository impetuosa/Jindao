Class {
	#name : #JinDAMModule,
	#superclass : #JinDAMUserType,
	#instVars : [
		'invocables',
		'types'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMModule >> addInvocable: anInvocable [ 
	 invocables add: anInvocable 
]

{ #category : #accessing }
JinDAMModule >> addType: aJinDAMPrimitiveType [
	self types add: aJinDAMPrimitiveType
]

{ #category : #testing }
JinDAMModule >> find: aJinNSKind named: aString [

	aJinNSKind isType ifTrue: [ 
		^ types detect: [ :t | t name = aString ] ].

	aJinNSKind isInvocable ifTrue: [ 
		^ invocables detect: [ :t | t selector = aString ] ].
	
	^ super find: aJinNSKind named: aString
]

{ #category : #accessing }
JinDAMModule >> findAttributeInvocable: aString amountArguments: amount [

	| sup this |
	sup := super findAttributeInvocable: aString amountArguments: amount.
	this := invocables select: [ :a | 
		        (a name compare: aString caseSensitive: false) = 2 and: [ 
			        amount = a parametersSize ] ].
	this ifEmpty: [
	this := invocables select: [ :a | 
		        (a name compare: aString caseSensitive: false) = 2 and: [ 
			        amount <= a parametersSize ] ]].
^ sup , this
]

{ #category : #accessing }
JinDAMModule >> initialize [

	super initialize.

	invocables := OrderedCollection new
]

{ #category : #accessing }
JinDAMModule >> relatedSymbolKind [

	^ JinNSKind module
]

{ #category : #accessing }
JinDAMModule >> types [

	^ types ifNil: [ types := OrderedCollection new ]
]