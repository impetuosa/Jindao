Class {
	#name : #JinLibraryReferenceVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Visitors'
}

{ #category : #accessing }
JinLibraryReferenceVisitor >> referenceLibrary [

	^ self
]

{ #category : #accessing }
JinLibraryReferenceVisitor >> visitLibraryMethod: aMethod [

	self visitCollection: aMethod parameters
]
