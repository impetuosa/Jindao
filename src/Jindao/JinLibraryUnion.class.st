Class {
	#name : #JinLibraryUnion,
	#superclass : #JinLibraryStructure,
	#category : #'Jindao-DLL-Library'
}

{ #category : #'as yet unclassified' }
JinLibraryUnion >> acceptVisitor: aVisitor [
 aVisitor visitLibraryUnion: self.

]
