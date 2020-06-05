"
I just track down the usage of methods and properties. 
To know what seems to be important and what does not 
"
Class {
	#name : #JinSnifferHandle,
	#superclass : #JinCachingHandle,
	#category : #'Jindao-DomainObjects-Properties'
}

{ #category : #properties }
JinSnifferHandle >> asSnifferHandle [
	^ self 
]

{ #category : #properties }
JinSnifferHandle >> dispatch: aFunctionName withArguments: arguments [
	| methods amount |
	methods := self privateMethodsCache.
	amount := methods at: aFunctionName ifAbsent: [ 0 ].
	methods at: aFunctionName put: amount + 1.
	^ super dispatch: aFunctionName withArguments: arguments
]

{ #category : #properties }
JinSnifferHandle >> propertyNamed: aPropName put: aValue [
	| properties amount |
	properties := self privateSettersCache.
	amount := properties at: aPropName ifAbsent: [ 0 ].
	properties at: aPropName put: amount + 1.
	^ super propertyNamed: aPropName put: aValue
]

{ #category : #properties }
JinSnifferHandle >> propertyNamed: aPropName withArguments: arguments [
	| properties amount |
	properties := self privateGettersCache.
	amount := properties at: aPropName ifAbsent: [ 0 ].
	properties at: aPropName put: amount + 1.
	^ super propertyNamed: aPropName withArguments: arguments
]
