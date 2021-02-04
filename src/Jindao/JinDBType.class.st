Class {
	#name : #JinDBType,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classInstVars : [
		'pool'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #'instance creation' }
JinDBType class >> for: aName [
	^ self pool
		at: aName
		ifAbsentPut: [ self new
				name: aName;
				yourself ]
]

{ #category : #'instance creation' }
JinDBType class >> pool [
	^ pool ifNil: [ pool := Dictionary new ]
]

{ #category : #'as yet unclassified' }
JinDBType >> allDependencies [
	^ {}
]

{ #category : #accessing }
JinDBType >> name: aName [
	name := aName
]

{ #category : #accessing }
JinDBType >> printOn: aStream [
	aStream
		nextPutAll: 'DBType ';
		nextPutAll: name
]
