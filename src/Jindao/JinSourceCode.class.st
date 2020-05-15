"
I represent the source code part of a module, form, macro, etc. 

I am able to show my contents 
"
Class {
	#name : #JinSourceCode,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #'Jindao-DomainObjects-Properties'
}

{ #category : #'as yet unclassified' }
JinSourceCode >> acceptVisitor: aVisitor [
	aVisitor visitSourceCode: self 
]

{ #category : #'as yet unclassified' }
JinSourceCode >> amountOfElements [
	^ self elements size 
]

{ #category : #'as yet unclassified' }
JinSourceCode >> amountOfLines [
	^ handle propertyNamed: #CountOfLines
]

{ #category : #'as yet unclassified' }
JinSourceCode >> contents [
	^ self contentsFrom: 1 to: self amountOfLines 
]

{ #category : #'as yet unclassified' }
JinSourceCode >> contentsFrom: from to: to [
	^ handle
		propertyNamed: #Lines
		withArguments:
			{from.
			to}
]

{ #category : #'as yet unclassified' }
JinSourceCode >> elements [
	^ self contents lines
		inject: Set new 
		into: [ :acc :element | 
			(({String space . String tab.
			'End'} anySatisfy: [ :b | element beginsWith: b ])
				or: [ element size < 5 ])
				ifTrue: [ acc ]
				ifFalse: [ acc add: element. acc   ] ]
]

{ #category : #'as yet unclassified' }
JinSourceCode >> handle: aCOMDispatchInstance [ 
	handle := aCOMDispatchInstance
]

{ #category : #'as yet unclassified' }
JinSourceCode >> isNotEmpty [
	^ self amountOfLines > 0
]
