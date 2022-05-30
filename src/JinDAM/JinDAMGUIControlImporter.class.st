Class {
	#name : #JinDAMGUIControlImporter,
	#superclass : #JinGUIControlVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#instVars : [
		'loadObjectProperties'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #'as yet unclassified' }
JinDAMGUIControlImporter >> createInitializerForControl: aJinDAMAttribute with: aJinLabel [

	| access parentAccess no |
	no := true.
	aJinLabel handle getTypeInfo properties
		select: [ :a | a name asLowercase endsWith: 'source' ]
		thenDo: [ :a | 
			| value |
			a name = #RecordSource ifTrue: [ 
				(aJinLabel handle propertyNamed: #RowSourceType) = 'Value List' 
					ifTrue: [ no := false ].
				self halt ].
			no ifTrue: [ 
				value := aJinLabel handle propertyNamed: a name.
				value = '' ifFalse: [ 
					value isString ifTrue: [ 
						(value beginsWith: '=') ifFalse: [ 
							(value asLowercase includesSubstring: 'select')
								ifTrue: [ " Here articulate loading of SQL query " ]
								ifFalse: [ 
									self state top invocables
										detect: [ :i | i isInitializer ]
										ifFound: [ :initializer | 
											parentAccess := initializer accesses
												                detect: [ :acc | 
												                acc writeReference name = #RecordSource ]
												                ifFound: [ :f | f readReference typeName ]
												                ifNone: [ ^ self ].


											access := self instantiate: JinDAMAccessWrite.

											access
												writeReference: (self
														 instantiateReferenceForNames: { 
																 aJinLabel name.
																 { 
																	 a name.
																	 #member } }
														 context: access
														 preferring: { #isAttribute. #isType. #isLet. #isSet });
												isReturn: false.

											access readReference: (self
													 instantiateReferenceForNames: { 
															 parentAccess.
															 { 
																 value.
																 #member } }
													 context: initializer
													 preferring: { #isAttribute . #isQuery }).


											initializer addAccess: access ] ] ] ] ] ] ]
]

{ #category : #initialization }
JinDAMGUIControlImporter >> doLoadObjectProperties [

	loadObjectProperties := true
]

{ #category : #initialization }
JinDAMGUIControlImporter >> doNotLoadObjectProperties [

	loadObjectProperties := false
]

{ #category : #initialization }
JinDAMGUIControlImporter >> initialize [

	super initialize.
	loadObjectProperties := true.
	
]

{ #category : #'as yet unclassified' }
JinDAMGUIControlImporter >> nodeToTypeReferenceName: aVBNode context: aContext [ 
	^ self referenceNameConverter toTypeReferenceName: aVBNode context: aContext 
]

{ #category : #initialization }
JinDAMGUIControlImporter >> setUpObject: aJinDAMObject with: aCollection [

	aCollection do: [ :a | aJinDAMObject propertyEntryFor: a ]
]

{ #category : #'as yet unclassified' }
JinDAMGUIControlImporter >> visitAccessProperty: anAccessProperty [
	^self halt. 
]

{ #category : #'entry-point' }
JinDAMGUIControlImporter >> visitFormControl: anObject [

	| attribute instance |
	attribute := self instantiate: JinDAMAttribute.

	[ self createInitializerForControl: attribute with: anObject ]
		on: Error
		do: [ :e | e passIfNotError0x80020009 ].

	attribute visibility: #Public.
	attribute name: anObject name.
	attribute anchor: self state top anchor / #controls / anObject name.
	attribute typeReference: (self
			 instantiateReferenceForNames: { { 
					 anObject mappedTypeName.
					 #member } }
			 context: attribute
			 preferring: { #isType }).
	self state top addAttribute: attribute.

	instance := self state top defaultInstance objectEntryFor: attribute.
	self setUpObject: instance with: anObject documentedProperties
]
