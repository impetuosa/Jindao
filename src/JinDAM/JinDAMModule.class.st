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
