Class {
	#name : #JinAngularComponentBehaviour,
	#superclass : #JinAngularNamedObject,
	#instVars : [
		'classRepresentation'
	],
	#category : #JindaoAngular
}

{ #category : #visiting }
JinAngularComponentBehaviour >> acceptVisitor: aJinInspectorBuilder [

	aJinInspectorBuilder visitAngularComponentBehavior: self
]

{ #category : #'as yet unclassified' }
JinAngularComponentBehaviour >> classRepresentation [

	^ classRepresentation ifNil: [ 
		  classRepresentation := JinTypescriptClassLoader 
			                         loadClassFromFile: path ]
]

{ #category : #generated }
JinAngularComponentBehaviour >> interfaces [
	^ self classRepresentation types 
]

{ #category : #accessing }
JinAngularComponentBehaviour >> methods [
	^ self classRepresentation methods 
]

{ #category : #accessing }
JinAngularComponentBehaviour >> name [
	^ 'Behavior'
]

{ #category : #accessing }
JinAngularComponentBehaviour >> parents [

	^ self classRepresentation parents
]

{ #category : #accessing }
JinAngularComponentBehaviour >> properties [
	^ self classRepresentation properties 
]

{ #category : #accessing }
JinAngularComponentBehaviour >> superclass [
	^ self classRepresentation superclass 
]
