Class {
	#name : #JinForm,
	#superclass : #JinVBObject,
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinForm class >> typeNumber [
	^ 2
]

{ #category : #'as yet unclassified' }
JinForm >> acceptVisitor: aVisitor [
	aVisitor visitForm: self.
	
]

{ #category : #'as yet unclassified' }
JinForm >> addControl: aJinLabel [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinForm >> code [
	^ self body code
]

{ #category : #'as yet unclassified' }
JinForm >> controls [
	^ self body controls 
]

{ #category : #'as yet unclassified' }
JinForm >> hasModule [
	^ self body hasModule
]

{ #category : #'as yet unclassified' }
JinForm >> module [
	^ self body module
]

{ #category : #accessing }
JinForm >> privateLoadBodyObject [
	^ (project openForm: self)
]

{ #category : #accessing }
JinForm >> vbeComponentName [
	^ 'Form_' , self name
]
