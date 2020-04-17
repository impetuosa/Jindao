"
I am a smart factory. 
I map control types to partially other classes. According to my childs, i may generate or map to existing classes 
"
Class {
	#name : #JinControlsFactory,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : #'Jindao-Factories'
}

{ #category : #accessing }
JinControlsFactory class >> default [
	^ JinControlsOnlyGenericsFactory new
]

{ #category : #accessing }
JinControlsFactory >> classFor: aControl [
	^ self classFor: aControl ifNone: [ JinControlGeneric ]
]

{ #category : #accessing }
JinControlsFactory >> classFor: aControl ifNone: aBlock [
	self subclassResponsibility 
]

{ #category : #accessing }
JinControlsFactory >> control: aControl mapsWith: aJinControlClass [
	^ aControl getTypeInfo name = aJinControlClass mappedTypeName
]

{ #category : #accessing }
JinControlsFactory >> elementFor: aControl [
	^ (self classFor: aControl) new
		handle: aControl;
		parent: parent;
		yourself
]

{ #category : #accessing }
JinControlsFactory >> parent: aParent [
	parent := aParent 
]
