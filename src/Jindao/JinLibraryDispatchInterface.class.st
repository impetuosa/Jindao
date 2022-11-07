Class {
	#name : #JinLibraryDispatchInterface,
	#superclass : #JinLibraryModule,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryDispatchInterface >> acceptVisitor: aVisitor [

	^ aVisitor visitLibraryDispatchInterface: self
]
