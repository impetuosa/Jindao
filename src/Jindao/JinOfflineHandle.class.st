"
I only access cache state. 
If it is in the cachem, fine, if not error. I am not a cache builder! Use stateTrackign or cached handle for building. Then go offline .
"
Class {
	#name : #JinOfflineHandle,
	#superclass : #JinCachingHandle,
	#category : #'Jindao-DomainObjects-Properties'
}

{ #category : #properties }
JinOfflineHandle >> asOffline [
	^ self
]

{ #category : #properties }
JinOfflineHandle >> dispatch: aFunctionName withArguments: arguments [
	^ self privateMethodsCache
		at:
			{aFunctionName.
			arguments}
		ifAbsentPut: [ self error: 'Using offline handle. ' ]
]

{ #category : #properties }
JinOfflineHandle >> propertyNamed: aPropName put: aValue [
	self error: 'Using offline handle. '
]

{ #category : #properties }
JinOfflineHandle >> propertyNamed: aPropName withArguments: arguments [
	^ self privateGettersCache
		at:
			{aPropName.
			arguments}
		ifAbsentPut: [ self error: 'Using offline handle. ' ]
]
