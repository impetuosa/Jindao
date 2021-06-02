Class {
	#name : #JinLibraryStructure,
	#superclass : #JinLibraryType,
	#instVars : [
		'instanceVariables'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibraryStructure >> instanceVariables: aCollection [

	instanceVariables := aCollection.
	aCollection do: [ :m | m owner: self ]
]
