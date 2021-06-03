Class {
	#name : #JinLibraryUnion,
	#superclass : #JinLibraryStructure,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryUnion >> accept: aVisitor [
	^ aVisitor visitUnion: self.

]
