Class {
	#name : #JinMetrics,
	#superclass : #Object,
	#instVars : [
		'children',
		'properties',
		'dependancies'
	],
	#category : #'Jindao-Metrics'
}

{ #category : #consolidation }
JinMetrics >> allDependencies [
	^ self dependencies
		,
			((self dependencies reject: #isArray)
				flatCollect: [ :d | d allDependencies ])
		, (self children flatCollect: #allDependencies)
]

{ #category : #'as yet unclassified' }
JinMetrics >> child: aString [
	^ children at: aString
]

{ #category : #'as yet unclassified' }
JinMetrics >> child: aString put: aChild [
	^ children at: aString put: aChild
]

{ #category : #initialization }
JinMetrics >> children [
	^ children values flatCollect: #yourself
]

{ #category : #'as yet unclassified' }
JinMetrics >> dependencies [
	^ dependancies 
]

{ #category : #'as yet unclassified' }
JinMetrics >> incrementCounterFor: aString [
	| val |
	val := properties at: aString ifAbsentPut: [ 0 ].
	properties at: aString put: val + 1
]

{ #category : #initialization }
JinMetrics >> initialize [
	super initialize.
	children := Dictionary new.
	properties := Dictionary new.
	dependancies := Set new
]

{ #category : #initialization }
JinMetrics >> newEntryForType: anObjectType [
	| metric type |
	type := self class environment
		at: ('Jin{1}Metric' format: {anObjectType}) asSymbol.
	metric := type new.
	metric register: #AccesType value: anObjectType.
	(children at: anObjectType ifAbsentPut: [ OrderedCollection new ])
		add: metric.
	^ metric
]

{ #category : #'as yet unclassified' }
JinMetrics >> properties [
	^ properties
]

{ #category : #initialization }
JinMetrics >> register: aName value: aValue [
	properties at: aName put: aValue
]

{ #category : #initialization }
JinMetrics >> registerDependancy: aDependancy kind: aKindOfDependancy [
	dependancies
		add:
			{aKindOfDependancy.
			aDependancy}
]

{ #category : #'as yet unclassified' }
JinMetrics >> registeredDependencies [
	^ dependancies
]

{ #category : #'as yet unclassified' }
JinMetrics >> solveDependanciesWith: aRoot [
	| newDeps |
	dependancies := dependancies reject: #isNil.
	newDeps := (dependancies
		select: #isArray
		thenCollect: [ :d | 
			d
				->
					(aRoot
						perform: ('solveDependencyOn{1}Named:' format: {d first}) asSymbol
						withArguments: {d second}) ]) asDictionary.
	dependancies removeAll: newDeps keys.
	dependancies addAll: newDeps values.
	dependancies := dependancies reject: #isNil.
	self children do: [ :c | c solveDependanciesWith: aRoot ]
]

{ #category : #'as yet unclassified' }
JinMetrics >> solveDependencyOnCustomControlNamed: aString [
	^ JinCustomControlType new
		name: aString;
		yourself
]

{ #category : #'as yet unclassified' }
JinMetrics >> solveDependencyOnDBTypeNamed: aDBTypeName [
	^ JinDBType for: aDBTypeName
]

{ #category : #'as yet unclassified' }
JinMetrics >> solveDependencyOnEmbddedQueryNamed: aString [
	^ JinEmbbeddedQuery new
		sql: aString;
		yourself
]

{ #category : #'as yet unclassified' }
JinMetrics >> solveDependencyOnFormNamed: aString [
	^ self forms
		detect: [ :f | f name asLowercase asSymbol = aString asSymbol ]
		ifNone: [ JinCrossProjectDependancy new
				type: #Form;
				name: aString;
				yourself ]
]

{ #category : #'as yet unclassified' }
JinMetrics >> solveDependencyOnQueryNamed: aName [
	aName isEmpty
		ifTrue: [ ^ nil ].
	^ self queries
		detect: [ :t | t name asLowercase asSymbol = aName asLowercase asSymbol ]
]

{ #category : #'as yet unclassified' }
JinMetrics >> solveDependencyOnTableNamed: aName [
	aName isEmpty
		ifTrue: [ ^ nil ].
	^ self tables
		detect: [ :t | t name asLowercase asSymbol = aName asLowercase asSymbol ]
]

{ #category : #'as yet unclassified' }
JinMetrics >> value: aString [
	^ properties at: aString
]

{ #category : #'as yet unclassified' }
JinMetrics >> valueOrEmpty: aString [
	^ properties at: aString ifAbsent: [ '' ]
]

{ #category : #'as yet unclassified' }
JinMetrics >> valueOrZero: aString [
	^ properties at: aString ifAbsent: [ 0 ]
]
