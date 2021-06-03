Class {
	#name : #JinLibraryInterface,
	#superclass : #JinLibraryModule,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryInterface >> accept: aVisitor [
	^ aVisitor visitInterface: self.

]
