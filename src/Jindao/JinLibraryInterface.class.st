Class {
	#name : #JinLibraryInterface,
	#superclass : #JinLibraryCoClass,
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryInterface >> acceptVisitor: aVisitor [

	^ aVisitor visitLibraryInterface: self
]

{ #category : #'as yet unclassified' }
JinLibraryInterface >> linkedType [
	| comp | 
	comp := 'Disp', ((name beginsWith:'_')  ifTrue: [ name copyFrom:2 to: name size ] ifFalse:[ name ]).
	
	^ owner types detect: [ :t | 
		  (t name compare: comp caseSensitive: false) = 2 ] ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
JinLibraryInterface >> printOn: aStream [

	aStream
		nextPutAll: 'Interface(';
		nextPutAll: name;
		nextPut: $:.
	self linkedType ifNotNil: [: l| l printOn: aStream].
	aStream nextPutAll: ')'
]
