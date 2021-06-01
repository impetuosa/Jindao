Class {
	#name : #JinLibraryEnumValue,
	#superclass : #Object,
	#instVars : [
		'name',
		'value'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibraryEnumValue >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinLibraryEnumValue >> printOn: aStream [

	aStream
		nextPutAll: 'EV(';
		nextPutAll: name;
		nextPutAll: '=';
		nextPutAll: value asString;
		nextPutAll: ')'
]

{ #category : #accessing }
JinLibraryEnumValue >> value: aCOMVar [ 
	value := aCOMVar
]
