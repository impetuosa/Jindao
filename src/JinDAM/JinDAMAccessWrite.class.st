Class {
	#name : #JinDAMAccessWrite,
	#superclass : #JinDAMAccessRead,
	#instVars : [
		'writeReference',
		'isReturn',
		'isNewObject',
		'processing'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMAccessWrite >> addAccess: aJinDAMAccessRead [

	processing = #write ifTrue: [ 
		^ self writeReference: aJinDAMAccessRead ].
	processing = #read ifTrue: [ 
		^ self readReferences add: aJinDAMAccessRead ].
	self error: ' asd '
]

{ #category : #testing }
JinDAMAccessWrite >> hasReads [

	^ readReference isEmptyOrNil not
]

{ #category : #testing }
JinDAMAccessWrite >> isNewObject: aBoolean [

	isNewObject := aBoolean
]

{ #category : #testing }
JinDAMAccessWrite >> isReturn: aBoolean [

	isReturn := aBoolean
]

{ #category : #accessing }
JinDAMAccessWrite >> printOn: aStream [

	aStream nextPutAll: '+W '.
	writeReference printOn: aStream.
	aStream nextPutAll: ' = '.
	readReference printOn: aStream
]

{ #category : #'as yet unclassified' }
JinDAMAccessWrite >> processingFinished [
	processing := #finished. 
]

{ #category : #'as yet unclassified' }
JinDAMAccessWrite >> processingRead [
	processing := #read.
]

{ #category : #'as yet unclassified' }
JinDAMAccessWrite >> processingWrite [
	processing := #write.
]

{ #category : #'as yet unclassified' }
JinDAMAccessWrite >> readReferences [

	^ readReference ifNil: [ readReference := OrderedCollection new ]
]

{ #category : #accessing }
JinDAMAccessWrite >> writeReference: aJinDAMVariableReference [

	(aJinDAMVariableReference isKindOf: JinDAMEntity) ifFalse: [ 
		self halt ].
	writeReference := aJinDAMVariableReference
]
