"
I am a handle object. I have a name and a PharoCOM handle. 
I have two faces. The closed (or meta face), and the loaded face. 
The loaded face is the one that has most of the description .
"
Class {
	#name : #JinBodyObject,
	#superclass : #JinAccessObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinBodyObject >> name [
	^ handle propertyNamed:#Name 
]

{ #category : #'as yet unclassified' }
JinBodyObject >> parent: anUndefinedObject [ 
]
