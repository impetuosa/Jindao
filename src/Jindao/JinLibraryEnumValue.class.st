"
I represent a specific ENUM value defined in the library
"
Class {
	#name : #JinLibraryEnumValue,
	#superclass : #JinLibraryConstant,
	#category : #'Jindao-MSAccess-Library'
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
