Class {
	#name : #JinAngularProtoComponentBehavior,
	#superclass : #Object,
	#instVars : [
		'angularModel'
	],
	#category : #JindaoMoose
}

{ #category : #accessing }
JinAngularProtoComponentBehavior >> acceptVisitor: aJinViewportPageBuilder [

	aJinViewportPageBuilder visitAngularProtoComponentBehavior: self
]

{ #category : #accessing }
JinAngularProtoComponentBehavior >> angularModel: aTypescriptClass [
	angularModel := aTypescriptClass 
]

{ #category : #generated }
JinAngularProtoComponentBehavior >> interfaces [
	^ angularModel types 
]

{ #category : #accessing }
JinAngularProtoComponentBehavior >> methods [
	^ angularModel methods 
]

{ #category : #accessing }
JinAngularProtoComponentBehavior >> name [
	^ 'Behavior'
]

{ #category : #accessing }
JinAngularProtoComponentBehavior >> properties [
	^ angularModel properties 
]

{ #category : #accessing }
JinAngularProtoComponentBehavior >> sourceCode [

	^ angularModel sourceCode
]

{ #category : #accessing }
JinAngularProtoComponentBehavior >> superclass [

	^ angularModel superclass
]
