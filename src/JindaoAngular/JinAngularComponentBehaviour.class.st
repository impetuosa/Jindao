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
		  classRepresentation := JinTypescriptLoader loadClassFromStream:
			                         path readStream ]
]

{ #category : #accessing }
JinAngularComponentBehaviour >> name [
	^ 'Behavior'
]

{ #category : #accessing }
JinAngularComponentBehaviour >> parents [

	^ self classRepresentation parents
]
