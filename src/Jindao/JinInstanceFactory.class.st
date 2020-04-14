Class {
	#name : #JinInstanceFactory,
	#superclass : #Object,
	#instVars : [
		'useClass',
		'project'
	],
	#category : #'Jindao-Factories'
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
		project: project; 
		yourself
]

{ #category : #accessing }
JinInstanceFactory >> project: aProject [
	project := aProject
]

{ #category : #accessing }
JinInstanceFactory >> useClass: aClass [
	useClass := aClass. 
]
