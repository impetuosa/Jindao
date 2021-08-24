Class {
	#name : #JinDAMAccessRead,
	#superclass : #JinDAMAccess,
	#instVars : [
		'readReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMAccessRead >> addArgument: aJinDAMArgument [ 
	readReference addArgument: aJinDAMArgument 
]

{ #category : #accessing }
JinDAMAccessRead >> candidate [
	 ^ readReference candidate 
]

{ #category : #accessing }
JinDAMAccessRead >> isReadAccess [
	^ true 
]

{ #category : #accessing }
JinDAMAccessRead >> name [
	^ readReference candidate ifNil:[ 'Unresolved' ] ifNotNil: [ readReference candidate name  ]
]

{ #category : #accessing }
JinDAMAccessRead >> printOn: aStream [
	aStream nextPutAll: '+R '.
	readReference printOn: aStream
]

{ #category : #accessing }
JinDAMAccessRead >> readReference [

	self assert: readReference isCollection not.
	^ readReference
]

{ #category : #accessing }
JinDAMAccessRead >> readReference: aJinDAMVariableReference [ 
	
	readReference := aJinDAMVariableReference.
]
