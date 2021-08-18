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
JinDAMAccessRead >> name [

	^ readReference name
]

{ #category : #accessing }
JinDAMAccessRead >> printOn: aStream [
	aStream nextPutAll: '+R '.
	readReference printOn: aStream
]

{ #category : #accessing }
JinDAMAccessRead >> readReference: aJinDAMVariableReference [ 
	
	readReference := aJinDAMVariableReference.
]
