Class {
	#name : #JinLibraryCoClass,
	#superclass : #JinLibraryType,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibraryCoClass >> constants [
	^ self linkedType constants
]

{ #category : #accessing }
JinLibraryCoClass >> instanceVariables [
	^ self linkedType instanceVariables
]

{ #category : #accessing }
JinLibraryCoClass >> linkedType [
	^ owner types detect: [ :t | 
		  (t name compare: '_' , name caseSensitive: true) = 2 ]
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
	self linkedType printOn: aStream.
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
