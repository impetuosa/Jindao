Class {
	#name : #JinForm,
	#superclass : #JinModelObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinForm >> acceptVisitor: aVisitor [
	aVisitor visitForm: self.
	
]

{ #category : #'as yet unclassified' }
JinForm >> code [
	^ self body code
]

{ #category : #'as yet unclassified' }
JinForm >> controls [
	^ self body controls 
]

{ #category : #accessing }
JinForm >> privateLoadBodyObject [
	^ (project openForm: self)
]
