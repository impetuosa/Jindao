Class {
	#name : #JinLibraryDispatchInterface,
	#superclass : #JinLibraryModule,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryDispatchInterface >> accept: aVisitor [
	^ aVisitor visitDispatchInterface: self.

]
