Class {
	#name : #JinDAMAttributeAccessor,
	#superclass : #JinDAMFunction,
	#instVars : [
		'kind',
		'attribute'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMAttributeAccessor >> attribute: aJinDAMAttribute [

	attribute := aJinDAMAttribute
]

{ #category : #accessing }
JinDAMAttributeAccessor >> kind [
	^ kind
]

{ #category : #accessing }
JinDAMAttributeAccessor >> kind: aString [ 
	kind := aString
]
