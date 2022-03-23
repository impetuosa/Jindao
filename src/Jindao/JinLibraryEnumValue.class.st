Class {
	#name : #JinLibraryEnumValue,
	#superclass : #JinLibraryConstant,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryEnumValue >> acceptVisitor: aVisitor [
 aVisitor visitLibraryEnumValue: self.

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
