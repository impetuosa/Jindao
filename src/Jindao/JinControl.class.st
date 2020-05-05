Class {
	#name : #JinControl,
	#superclass : #JinProtoHandleObject,
	#instVars : [
		'parent'
	],
	#category : #'Jindao-DomainObjects'
}

{ #category : #'as yet unclassified' }
JinControl class >> mappedTypeName [
	^ false 
]

{ #category : #'as yet unclassified' }
JinControl >> acceptVisitor: aVisitor [
	aVisitor visitControl: self
]

{ #category : #'as yet unclassified' }
JinControl >> containingWidget [
	^ parent 
]

{ #category : #'as yet unclassified' }
JinControl >> controlName [
	^ handle propertyNamed: #ControlName
]

{ #category : #'as yet unclassified' }
JinControl >> handle: aCOMDispatchInstance [ 
	handle := aCOMDispatchInstance
]

{ #category : #'as yet unclassified' }
JinControl >> jinParent [
	^ parent 
]

{ #category : #'as yet unclassified' }
JinControl >> parent: aParent [ 
	parent := aParent 
]

{ #category : #'as yet unclassified' }
JinControl >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $[;
		nextPutAll: self controlName;
		nextPut: $]
]
