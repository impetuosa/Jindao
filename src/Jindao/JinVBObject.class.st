Class {
	#name : #JinVBObject,
	#superclass : #JinModelObject,
	#instVars : [
		'vbeComponent'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinVBObject >> close [ 
	super close.
	vbeComponent := nil 
]

{ #category : #'as yet unclassified' }
JinVBObject >> properties [
	^ self vbeComponent properties
]

{ #category : #'as yet unclassified' }
JinVBObject >> vbeComponent [
	^ vbeComponent
		ifNil: [ vbeComponent := project vbeComponentFor: self ]
]

{ #category : #'as yet unclassified' }
JinVBObject >> vbeComponentName [
	^ self subclassResponsibility 
]
