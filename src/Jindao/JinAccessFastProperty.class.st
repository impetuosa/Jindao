"
I represent a propery that can be accessed as a message send. Therefore i am cheaper than a simple property. 
"
Class {
	#name : #JinAccessFastProperty,
	#superclass : #Object,
	#instVars : [
		'accessObject',
		'name'
	],
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinAccessFastProperty >> accessObject: aJinLabel [ 
	accessObject := aJinLabel
]

{ #category : #accessing }
JinAccessFastProperty >> name [ 
	^ name
]

{ #category : #accessing }
JinAccessFastProperty >> name: aName [
	name := aName 
]

{ #category : #accessing }
JinAccessFastProperty >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPut: $[;
		nextPutAll: accessObject name;
		nextPutAll: '.';
		nextPutAll: self name;
		nextPut: $]
]

{ #category : #accessing }
JinAccessFastProperty >> value [

	^ accessObject perform: name uncapitalized asSymbol
]
