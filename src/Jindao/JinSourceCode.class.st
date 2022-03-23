"
I represent the source code part of a module, form, macro, etc. 

I am able to show my contents 
"
Class {
	#name : #JinSourceCode,
	#superclass : #JinAccessObject,
	#category : #'Jindao-Core'
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

{ #category : #ast }
JinSourceCode >> ast [

	| semaphore result process |
	semaphore := Semaphore new.
	process := [ 
	           [ 
	           result := (self class environment at: #VBParser) parse:
		                     self contents ]
		           on: Error
		           do: [ :e | result := e ].
	           semaphore signal ] forkAt:
		           Processor userBackgroundPriority.
	^ semaphore
		  wait: 30 seconds
		  onCompletion: [ 
			  process terminate.
			  result isError ifTrue: [ ^ result signal ].
			  result ]
		  onTimeout: [ 
			  process terminate.
			  TimedOut new signal: 'TO' ]
]

{ #category : #'as yet unclassified' }
JinSourceCode >> content [
	^ self contents
]

{ #category : #'as yet unclassified' }
JinSourceCode >> contents [
	| lines |
	lines := self amountOfLines.
	lines <= 0
		ifTrue: [ ^ '' ].
	^ self contentsFrom: 1 to: lines
]

{ #category : #'as yet unclassified' }
JinSourceCode >> contentsFrom: from [ 
	^ self contentsFrom: from to: self amountOfLines 
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
JinSourceCode >> deleteLine: aNumber [
	handle
		dispatch: #DeleteLines
		withArguments:
			{aNumber.
			1}
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
JinSourceCode >> insertLines: aString [ 
	handle dispatch: #InsertLines withArguments: { self amountOfLines . aString }
]

{ #category : #'as yet unclassified' }
JinSourceCode >> isNotEmpty [
	^ self amountOfLines > 0
]

{ #category : #'as yet unclassified' }
JinSourceCode >> name [
	^ 'src'
]
