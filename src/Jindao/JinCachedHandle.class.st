"
I do cache calls. The first time goes through to access, the second time i get it from the cache. 
Pay attention, since non method/property is going to be called twice with the same arguments  my me. 
"
Class {
	#name : #JinCachedHandle,
	#superclass : #JinStateTrackingHandle,
	#category : #'Jindao-Handles'
}

{ #category : #'as yet unclassified' }
JinCachedHandle >> asCOMHandle [
	^ handle asCOMHandle 
]

{ #category : #properties }
JinCachedHandle >> asStateTrackingHandle [
	^ JinStateTrackingHandle new
		handle: handle;
		cache: cache;
		yourself
]

{ #category : #properties }
JinCachedHandle >> dispatch: aFunctionName withArguments: arguments [
	^ super dispatch: aFunctionName withArguments: arguments "self privateMethodsCache
		at:
			{aFunctionName.
			arguments}
		ifAbsentPut: [ super dispatch: aFunctionName withArguments: arguments ]"
]

{ #category : #properties }
JinCachedHandle >> propertyNamed: aPropName withArguments: arguments [
	^ self privateGettersCache
		at:
			{aPropName.
			arguments}
		ifAbsentPut: [ super propertyNamed: aPropName withArguments: arguments ]
]
