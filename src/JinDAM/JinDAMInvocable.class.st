Class {
	#name : #JinDAMInvocable,
	#superclass : #JinDAMEntity,
	#instVars : [
		'visibility',
		'selector',
		'parameters'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMInvocable >> accept: aVisitor [  
	^ aVisitor visitInvocable: self.

]

{ #category : #adding }
JinDAMInvocable >> addParameter: aJinDAMParameter [

	parameters add: aJinDAMParameter
]

{ #category : #initialization }
JinDAMInvocable >> initialize [
	 super initialize.
	parameters := OrderedCollection new . 
]

{ #category : #accessing }
JinDAMInvocable >> isInvocable [ 
	^ true 
]

{ #category : #accessing }
JinDAMInvocable >> name [
	 ^ selector 
]

{ #category : #accessing }
JinDAMInvocable >> parameters [
	 ^ parameters 
]

{ #category : #'as yet unclassified' }
JinDAMInvocable >> parametersSize [

	^ (parameters anySatisfy: [ :p | p typeReference name = 'ParamArray' ])
		  ifTrue: [ Float infinity ]
		  ifFalse: [ parameters size ]
]

{ #category : #accessing }
JinDAMInvocable >> relatedSymbolKind [
	 self subclassResponsibility 
]

{ #category : #accessing }
JinDAMInvocable >> selector [ 
	 ^ selector 
]

{ #category : #accessing }
JinDAMInvocable >> selector: aString [ 
	selector := aString
]

{ #category : #accessing }
JinDAMInvocable >> signature [

	^ String streamContents: [ :str | 
		  str
			  nextPutAll: selector;
			  nextPut: $(;
			  nextPutAll: (',' join: (parameters collect: [ :p | 
								    (p isOptional
									     ifTrue: [ 'OPTIONAL ' ]
									     ifFalse: [ '' ])
								    ,
									    (p typeReference
										     ifNil: [ 'Unknown' ]
										     ifNotNil: [ :t | t name ]) ]));
			  nextPut: $) ]
]

{ #category : #accessing }
JinDAMInvocable >> visibility [
	^ visibility 
]
