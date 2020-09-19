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
JinAngularProtoComponentBehavior >> name [
	^ 'Behavior'
]

{ #category : #accessing }
JinAngularProtoComponentBehavior >> sourceCode [

	^ angularModel sourceCode
]
