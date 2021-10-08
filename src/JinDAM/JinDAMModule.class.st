Class {
	#name : #JinDAMModule,
	#superclass : #JinDAMUserType,
	#instVars : [
		'invocables',
		'types',
		'astCannotLoad',
		'src'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMModule >> accept: aVisitor [  
	^ aVisitor visitModule: self.

]

{ #category : #accessing }
JinDAMModule >> addInvocable: anInvocable [ 
	 invocables add: anInvocable 
]

{ #category : #accessing }
JinDAMModule >> addType: aJinDAMPrimitiveType [
	self types add: aJinDAMPrimitiveType
]

{ #category : #accessing }
JinDAMModule >> astCannotLoad [
	^ astCannotLoad
]

{ #category : #'as yet unclassified' }
JinDAMModule >> astCannotLoad: aBoolean [

	astCannotLoad := aBoolean
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
JinDAMModule >> invocables [
	^ invocables
]

{ #category : #accessing }
JinDAMModule >> relatedSymbolKind [

	^ JinNSKind module
]

{ #category : #accessing }
JinDAMModule >> src [
	^ src
]

{ #category : #testing }
JinDAMModule >> src: aString [

	src := aString
]

{ #category : #accessing }
JinDAMModule >> types [

	^ types ifNil: [ types := OrderedCollection new ]
]
