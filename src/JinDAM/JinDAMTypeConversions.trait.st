Trait {
	#name : #JinDAMTypeConversions,
	#instVars : [
		'stringConverter',
		'referenceNameConverter'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> nodeToInvocableReferenceName: aVBNode [
	^ self referenceNameConverter toInvocableReferenceName: aVBNode
]

{ #category : #helper }
JinDAMTypeConversions >> nodeToString: aNode [
	| str |
	str := self stringConverter toString: aNode.
	^ str
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> nodeToTypeReferenceName: aVBNode [
	^ self referenceNameConverter toTypeReferenceName: aVBNode
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> nodeToVariableReferenceName: aVBNode [
	^ self referenceNameConverter toVariableReferenceName: aVBNode
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> referenceNameConverter [

	^ referenceNameConverter ifNil: [ 
		  referenceNameConverter := JinDAMVBVisitorToReferenceName new
			                            importer: self;
			                            yourself ]
]

{ #category : #helper }
JinDAMTypeConversions >> stringConverter [

	^ stringConverter
		ifNil: [ stringConverter := JinDAMVBVisitorToString new ]
]

{ #category : #'functions - subs - events' }
JinDAMTypeConversions >> typeName: aTypeOrNil [
	^ aTypeOrNil
		ifNil: [self referenceNameConverter undefinedTypeReference ]
		ifNotNil: [ self nodeToTypeReferenceName: aTypeOrNil ]
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> typeNameReference: aString [
	self assert: (aString indexOf: $.) = 0.
	^ (self instantiate: JinDAMTypeReference)
		names: {aString};
		yourself
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> undefinedTypeReference [
	^ self referenceNameConverter undefinedTypeReference
]
