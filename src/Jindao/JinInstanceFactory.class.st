Class {
	#name : #JinInstanceFactory,
	#superclass : #Object,
	#instVars : [
		'useClass'
	],
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinInstanceFactory class >> defaultFor: aClass [
	^ self new
		useClass: aClass;
		yourself
]

{ #category : #accessing }
JinInstanceFactory >> elementFor: aHandle [
	^ useClass new
		handle: aHandle;
		yourself
]

{ #category : #accessing }
JinInstanceFactory >> useClass: aClass [
	useClass := aClass. 
]
