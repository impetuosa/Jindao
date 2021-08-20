Class {
	#name : #JinDAMLiteralReference,
	#superclass : #JinDAMReference,
	#instVars : [
		'name',
		'literalKind'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMLiteralReference >> literalKind: aString [

	literalKind := aString asSymbol
]

{ #category : #accessing }
JinDAMLiteralReference >> name [
	^ candidate asString 
]

{ #category : #'as yet unclassified' }
JinDAMLiteralReference >> printOn: aStream [

	aStream
		nextPutAll: ' -> ( ';
		nextPutAll: literalKind ; 
		nextPutAll: ' Literal) ';
		nextPutAll: self adaptToAlceAnchorPathFragment;
		nextPutAll: ' ';
		nextPutAll:
			(candidate
				 ifNil: [ 'Unsolved' ]
				 ifNotNil: [ candidate asString ]).
	
]
