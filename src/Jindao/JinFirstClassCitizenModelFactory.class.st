"
I am a factory that creates elements of a given class .I set up a project into the instance and set up the handle into 
"
Class {
	#name : #JinFirstClassCitizenModelFactory,
	#superclass : #Object,
	#instVars : [
		'useClass',
		'project'
	],
	#category : #'Jindao-Factories'
}

{ #category : #'as yet unclassified' }
JinFirstClassCitizenModelFactory class >> defaultFor: aClass [
	^ self new
		useClass: aClass;
		yourself
]

{ #category : #accessing }
JinFirstClassCitizenModelFactory >> elementFor: aHandle [
	^ useClass new
		description:
			(JinDescriptionObject new
				handle: aHandle;
				yourself);
		project: project;
		yourself
]

{ #category : #accessing }
JinFirstClassCitizenModelFactory >> project: aProject [
	project := aProject
]

{ #category : #accessing }
JinFirstClassCitizenModelFactory >> useClass: aClass [
	useClass := aClass. 
]
