"
I have a cache that is initialized as soon as the handle is setted. 
"
Class {
	#name : #JinCachingHandle,
	#superclass : #JinHandle,
	#instVars : [
		'cache'
	],
	#category : #'Jindao-DomainObjects-Properties'
}

{ #category : #properties }
JinCachingHandle >> cache: aCache [
	cache := aCache
]

{ #category : #properties }
JinCachingHandle >> handle: aHandle [
	cache := Dictionary new.
	super handle: aHandle. 
]

{ #category : #properties }
JinCachingHandle >> privateGettersCache [
	^ cache at: #Getters ifAbsentPut: [ Dictionary new ]
]

{ #category : #properties }
JinCachingHandle >> privateMethodsCache [
	^ cache at: #Methods ifAbsentPut: [ Dictionary new ]
]

{ #category : #properties }
JinCachingHandle >> privateSettersCache [
	^ cache at: #Setters ifAbsentPut: [ Dictionary new ]
]
