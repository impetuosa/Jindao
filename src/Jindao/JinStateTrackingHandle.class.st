"
I do track down each return value of each operation per method / property and arguments
"
Class {
	#name : #JinStateTrackingHandle,
	#superclass : #JinCachingHandle,
	#category : #'Jindao-Handles'
}

{ #category : #properties }
JinStateTrackingHandle >> asCachedHandle [
	^ JinCachedHandle new
		handle: handle;
		cache: cache; 
		yourself
]

{ #category : #properties }
JinStateTrackingHandle >> asOffline [
	^ JinOfflineHandle new
		handle: handle;
		cache: cache;
		yourself
]

{ #category : #properties }
JinStateTrackingHandle >> asSnapshotHandle [
	^ JinSnapshotHandle new
		handle: handle;
		cache: cache;
		yourself
]

{ #category : #properties }
JinStateTrackingHandle >> asStateTrackingHandle [
	^ self
]

{ #category : #properties }
JinStateTrackingHandle >> dispatch: aFunctionName withArguments: arguments [
	| methods value |
	methods := self privateMethodsCache.
	[ 
		value := super dispatch: aFunctionName withArguments: arguments.
		methods at: {aFunctionName . arguments } put: value.
		^ value 
	] on: Error 	do: [ :err | 
			methods at: {aFunctionName . arguments } put: err.
			err signal
	]
]

{ #category : #properties }
JinStateTrackingHandle >> propertyNamed: aPropName withArguments: arguments [
	| properties value |
	properties := self privateGettersCache.
	[ 
		value := super propertyNamed: aPropName withArguments: arguments.
		properties at: {aPropName . arguments } put: value.
		^ value 
	] on: Error 	do: [ :err | 
			properties at: {aPropName . arguments } put: err.
			err signal
	]
]
