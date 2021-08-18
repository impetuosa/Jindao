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
JinDAMInvocable >> name [
	 ^ selector 
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
