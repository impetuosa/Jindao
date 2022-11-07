Class {
	#name : #JinLibraryCoClass,
	#superclass : #JinLibraryType,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryCoClass >> acceptVisitor: aVisitor [

	^ aVisitor visitLibraryCoClass: self
]

{ #category : #accessing }
JinLibraryCoClass >> constants [
	^ self linkedType constants
]

{ #category : #accessing }
JinLibraryCoClass >> definitions [ 
	^ self linkedType ifNotNil:[ :t | t definitions ] ifNil: [ {  } ]
]

{ #category : #accessing }
JinLibraryCoClass >> instanceVariables [
	^ self linkedType instanceVariables
]

{ #category : #accessing }
JinLibraryCoClass >> linkedType [
	^ owner types detect: [ :t | 
		  (t name compare: '_' , name caseSensitive: false) = 2 ] ifNone: [ nil ]
]

{ #category : #accessing }
JinLibraryCoClass >> methods [
	^ self linkedType methods
]

{ #category : #accessing }
JinLibraryCoClass >> printOn: aStream [

	aStream
		nextPutAll: 'CoClass(';
		nextPutAll: name;
		nextPut: $:.
"	self linkedType ifNotNil: [: l| l printOn: aStream]."
	aStream nextPutAll: ')'
]

{ #category : #accessing }
JinLibraryCoClass >> properties [
	^ self linkedType properties
]

{ #category : #accessing }
JinLibraryCoClass >> staticVariables [
	^ self linkedType staticVariables
]
