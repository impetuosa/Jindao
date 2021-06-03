Class {
	#name : #JinLibraryStructure,
	#superclass : #JinLibraryType,
	#instVars : [
		'instanceVariables'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryStructure >> accept: aVisitor [
	^ aVisitor visitStructure: self.

]

{ #category : #accessing }
JinLibraryStructure >> instanceVariables [
	^ instanceVariables
]

{ #category : #accessing }
JinLibraryStructure >> instanceVariables: aCollection [

	instanceVariables := aCollection.
	aCollection do: [ :m | m owner: self ]
]
