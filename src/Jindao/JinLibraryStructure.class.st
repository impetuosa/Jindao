"
I represent a Structure (struct like) defined in the library
"
Class {
	#name : #JinLibraryStructure,
	#superclass : #JinLibraryType,
	#instVars : [
		'instanceVariables'
	],
	#category : #'Jindao-MSAccess-Library'
}

{ #category : #'as yet unclassified' }
JinLibraryStructure >> acceptVisitor: aVisitor [

	^ aVisitor visitLibraryStructure: self
]

{ #category : #accessing }
JinLibraryStructure >> definitions [
	^ self instanceVariables 
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
