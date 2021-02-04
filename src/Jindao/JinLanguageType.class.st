Class {
	#name : #JinLanguageType,
	#superclass : #Object,
	#instVars : [
		'name',
		'isClassType'
	],
	#classInstVars : [
		'pool'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #'instance creation' }
JinLanguageType class >> for: aName [
	^ self pool
		at: aName
		ifAbsentPut: [ self new
				name: aName;
				yourself ]
]

{ #category : #'instance creation' }
JinLanguageType class >> pool [
	^ pool ifNil: [ pool := Dictionary new ]
]

{ #category : #'as yet unclassified' }
JinLanguageType >> allDependencies [
	^ {}
]

{ #category : #'as yet unclassified' }
JinLanguageType >> isClassType: aTrue [ 
	isClassType := aTrue.
]

{ #category : #accessing }
JinLanguageType >> name: aName [
	name := aName
]

{ #category : #accessing }
JinLanguageType >> printOn: aStream [
	aStream
		nextPutAll: 'LanguageType ';
		nextPutAll: name
]
