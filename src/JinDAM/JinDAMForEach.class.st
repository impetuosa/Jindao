Class {
	#name : #JinDAMForEach,
	#superclass : #JinDAMLoop,
	#instVars : [
		'each',
		'collection'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMForEach >> accept: aVisitor [

	^ aVisitor visitForEach: self
]

{ #category : #accessing }
JinDAMForEach >> collection [
	^ collection
]

{ #category : #accessing }
JinDAMForEach >> collection: aCollectionRef [

	collection := aCollectionRef
]

{ #category : #accessing }
JinDAMForEach >> each [
	^ each
]

{ #category : #accessing }
JinDAMForEach >> each: anEachElement [

	each := anEachElement
]
