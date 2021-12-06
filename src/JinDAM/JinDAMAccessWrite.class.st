Class {
	#name : #JinDAMAccessWrite,
	#superclass : #JinDAMAccessRead,
	#instVars : [
		'writeReference',
		'isReturn',
		'isNewObject',
		'processing',
		'assignedTo',
		'valueToAssign'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMAccessWrite >> accept: aVisitor [  
	^ aVisitor visitAccessWrite: self.

]

{ #category : #adding }
JinDAMAccessWrite >> addAccess: aJinDAMAccessRead [

	processing = #write ifTrue: [ 
		^ self writeReference: aJinDAMAccessRead ].
	processing = #read ifTrue: [ 
		^ self readReferences add: aJinDAMAccessRead ].
	self error: ' asd '
]

{ #category : #'as yet unclassified' }
JinDAMAccessWrite >> assignedTo: aJinDAMAccessRead [ 
	assignedTo := aJinDAMAccessRead 
]

{ #category : #testing }
JinDAMAccessWrite >> hasReads [

	^ readReference isEmptyOrNil not
]

{ #category : #accessing }
JinDAMAccessWrite >> isNewObject [
	^ isNewObject
]

{ #category : #testing }
JinDAMAccessWrite >> isNewObject: aBoolean [

	isNewObject := aBoolean
]

{ #category : #accessing }
JinDAMAccessWrite >> isReturn [
	^ isReturn
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

	^ (readReference ifNil: [ readReference := OrderedCollection new ])
		  asCollection
]

{ #category : #testing }
JinDAMAccessWrite >> references [

	^ readReference flatCollect: [ :r | r references ]
]

{ #category : #'as yet unclassified' }
JinDAMAccessWrite >> valueToAssign: aJinDAMAccessRead [

	valueToAssign := aJinDAMAccessRead
]

{ #category : #accessing }
JinDAMAccessWrite >> writeReference [
	^ writeReference
]

{ #category : #accessing }
JinDAMAccessWrite >> writeReference: aJinDAMVariableReference [

	(aJinDAMVariableReference isKindOf: JinDAMEntity) ifFalse: [ 
		self halt ].
	writeReference := aJinDAMVariableReference
]
