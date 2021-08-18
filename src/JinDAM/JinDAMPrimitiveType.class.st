Class {
	#name : #JinDAMPrimitiveType,
	#superclass : #JinDAMType,
	#category : #'JinDAM-Model'
}

{ #category : #printing }
JinDAMPrimitiveType >> printOn: aStream [

	aStream
		nextPutAll: 'PrimitiveType:';
		nextPutAll: name
]
