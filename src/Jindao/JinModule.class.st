Class {
	#name : #JinModule,
	#superclass : #JinModelObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinModule >> acceptVisitor: aVisitor [
	aVisitor visitModule: self 
]

{ #category : #'as yet unclassified' }
JinModule >> code [
	^ self body code
]

{ #category : #accessing }
JinModule >> privateLoadBodyObject [
	^ (project openModule: self) 
]
