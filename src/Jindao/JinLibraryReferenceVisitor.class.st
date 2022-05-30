Class {
	#name : #JinLibraryReferenceVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Subvisitor'
}

{ #category : #accessing }
JinLibraryReferenceVisitor >> referenceLibrary [

	^ self
]

{ #category : #accessing }
JinLibraryReferenceVisitor >> visitLibraryMethod: aMethod [

	self visitCollection: aMethod parameters
]
