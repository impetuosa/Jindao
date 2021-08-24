Trait {
	#name : #JinDAMTypeConversions,
	#instVars : [
		'stringConverter',
		'referenceNameConverter'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #helper }
JinDAMTypeConversions >> nodeToString: aNode [
	| str |
	str := self stringConverter toString: aNode.
	^ str
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> nodeToTypeReferenceName: aVBNode context: aContext [ 
	^ self referenceNameConverter toTypeReferenceName: aVBNode context: aContext 
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> nodeToVariableReferenceName: aVBSimpleIdentifierNode context: aJinDAMAccessRead anchoringSymbol: aJinNSNameEntry [ 
	self shouldBeImplemented.
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
JinDAMTypeConversions >> typeName: aTypeOrNil context: aContext [ 
	^ aTypeOrNil
		ifNil: [self referenceNameConverter undefinedTypeReferenceContext: aContext  ]
		ifNotNil: [ self nodeToTypeReferenceName: aTypeOrNil context: aContext  ]
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> typeReferenceName: aString type: aJinDAMPrimitiveType context: aContext [

	| reference |
	self assert: (aString indexOf: '.') = 0.
	reference := self instantiate: JinDAMTypeReference.
	reference context: aContext. 
	reference typeName: aString.
	reference candidate: aJinDAMPrimitiveType.
	reference candidateAnchor: aJinDAMPrimitiveType anchor. 
	^ reference
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> typeReferenceName: aString typeSymbol: aCollection context: aContext [

	| reference potentialTypes |
	self assert: (aString indexOf: '.') = 0.

	
	potentialTypes := aCollection select: [ :p | p kind isType ].
	(aCollection isEmpty and: [  { 'NULL'. 'ERROR'. 'CARRAY'. 'SAFEARRAY'. 'ParamArray'. 'HRESULT' .
			 'COMUnknownInstance'. 'COMDispatchInstance' . 'USERDEFINED' .'Win32WideString' } includes: aString ]) ifFalse: [ ({ 'VOID' } includes: aString) ifTrue: [ 
			potentialTypes := potentialTypes select: [ :p | p name = aString ] ].
			
		
		self assert: potentialTypes isNotEmpty.
		potentialTypes size = 1
			ifTrue: [ 
				reference := self instantiate: JinDAMTypeReference.
				reference candidateAnchor: potentialTypes first anchor ]
			ifFalse: [ 
				self halt.
				
				reference := self instantiate: JinDAMMultipleTypeReference.
				reference candidateAnchors:
					(potentialTypes collect: [ :p | p anchor ]) ].
		reference context: aContext.
		reference typeName: aString ].

	^ reference
]

{ #category : #'as yet unclassified' }
JinDAMTypeConversions >> undefinedTypeReference [
	^ self referenceNameConverter undefinedTypeReference
]
