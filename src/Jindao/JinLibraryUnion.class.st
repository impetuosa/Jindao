Class {
	#name : #JinLibraryUnion,
	#superclass : #JinLibraryStructure,
	#category : #'Jindao-MSAccess-Library'
}

{ #category : #'as yet unclassified' }
JinLibraryUnion >> acceptVisitor: aVisitor [
 aVisitor visitLibraryUnion: self.

]
