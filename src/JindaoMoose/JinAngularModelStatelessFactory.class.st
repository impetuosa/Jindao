Class {
	#name : #JinAngularModelStatelessFactory,
	#superclass : #Object,
	#category : #JindaoMoose
}

{ #category : #'as yet unclassified' }
JinAngularModelStatelessFactory >> createNewAngularComponent [
	^ JinAngularProtoComponent new 
]

{ #category : #'as yet unclassified' }
JinAngularModelStatelessFactory >> createNewAngularComponentBehaviorWriter [
	^ JinAngularComponentBehaviorWriter new 
]

{ #category : #'as yet unclassified' }
JinAngularModelStatelessFactory >> createNewAngularComponentTemplateWriter [
	^ JinAngularComponentTemplateWriter new 
]
