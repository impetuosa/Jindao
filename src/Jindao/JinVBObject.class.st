Class {
	#name : #JinVBObject,
	#superclass : #JinModelObject,
	#instVars : [
		'vbeComponent'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinVBObject >> close [ 
	super close.
	vbeComponent := nil 
]

{ #category : #'as yet unclassified' }
JinVBObject >> properties [
	^ self hasModule
		ifTrue: [ self vbeComponent properties ]
		ifFalse: [ {} ]
]

{ #category : #'as yet unclassified' }
JinVBObject >> propertiesValues [
	^ self properties
		collect: [ :p | 
			| value |
			value := [ p value ]
				on: Error
				do: [ :e | 
					((e isKindOf: KeyNotFound) or: [ e isError0x80020009 ])
						ifTrue: [ nil ]
						ifFalse: [ e signal ] ].
			p name -> value ]
]

{ #category : #'as yet unclassified' }
JinVBObject >> vbeComponent [
	^ vbeComponent
		ifNil: [ vbeComponent := project vbeComponentFor: self ]
]

{ #category : #'as yet unclassified' }
JinVBObject >> vbeComponentName [
	^ self subclassResponsibility 
]
