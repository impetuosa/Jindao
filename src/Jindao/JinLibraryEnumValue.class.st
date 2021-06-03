Class {
	#name : #JinLibraryEnumValue,
	#superclass : #JinLibraryConstant,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryEnumValue >> accept: aVisitor [
	^ aVisitor visitEnumValue: self.

]

{ #category : #accessing }
JinLibraryEnumValue >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinLibraryEnumValue >> printOn: aStream [

	aStream
		nextPutAll: 'EV(';
		nextPutAll: name;
		nextPutAll: '=';
		nextPutAll: value asString;
		nextPutAll: ')'
]

{ #category : #accessing }
JinLibraryEnumValue >> value: aCOMVar [ 
	value := aCOMVar
]
