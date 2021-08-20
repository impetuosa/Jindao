Class {
	#name : #JinDAMEnumValue,
	#superclass : #JinDAMEntity,
	#instVars : [
		'name',
		'value'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMEnumValue >> name [
	^ name
]

{ #category : #accessing }
JinDAMEnumValue >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinDAMEnumValue >> printOn: aStream [

	aStream nextPutAll: 'EV ('.
	aStream
		nextPutAll: name;
		nextPut: $:;
		nextPutAll: value asString;
		nextPut: $)
]

{ #category : #accessing }
JinDAMEnumValue >> value [

	^ value
]

{ #category : #accessing }
JinDAMEnumValue >> value: anInteger [ 
	value := anInteger
]