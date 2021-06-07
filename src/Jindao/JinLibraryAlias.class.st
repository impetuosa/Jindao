Class {
	#name : #JinLibraryAlias,
	#superclass : #JinLibraryType,
	#instVars : [
		'aliaseeTypeName'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibraryAlias >> aliaseeTypeName: aString [ 
	aliaseeTypeName := aString
]
