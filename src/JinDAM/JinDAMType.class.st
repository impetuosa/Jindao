Class {
	#name : #JinDAMType,
	#superclass : #JinDAMEntity,
	#instVars : [
		'visibility',
		'name'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMType >> accept: aVisitor [  
	^ aVisitor visitType: self.

]

{ #category : #testing }
JinDAMType >> isType [

	^ true
]

{ #category : #testing }
JinDAMType >> isVariable [
	^ true 
]

{ #category : #accessing }
JinDAMType >> name [
	^ name
]

{ #category : #accessing }
JinDAMType >> name: aString [ 
	name := aString
]

{ #category : #generated }
JinDAMType >> type [

	^ self
]

{ #category : #accessing }
JinDAMType >> visibility [

	^ visibility ifNil: [ #Public ]
]
