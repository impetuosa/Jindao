Class {
	#name : #JinLibraryUnion,
	#superclass : #JinLibraryStructure,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryUnion >> acceptVisitor: aVisitor [
 aVisitor visitLibraryUnion: self.

]
