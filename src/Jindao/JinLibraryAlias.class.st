Class {
	#name : #JinLibraryAlias,
	#superclass : #JinLibraryType,
	#instVars : [
		'aliaseeTypeName'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibraryAlias >> acceptVisitor: aVisitor [

	^ aVisitor visitLibraryAlias: self
]

{ #category : #accessing }
JinLibraryAlias >> aliaseeTypeName [
	^ aliaseeTypeName
]

{ #category : #accessing }
JinLibraryAlias >> aliaseeTypeName: aString [ 
	aliaseeTypeName := aString
]
