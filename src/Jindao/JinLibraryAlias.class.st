"
I represent an Alias of an actual type.
"
Class {
	#name : #JinLibraryAlias,
	#superclass : #JinLibraryType,
	#instVars : [
		'aliaseeTypeName'
	],
	#category : #'Jindao-DLL-Library'
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
