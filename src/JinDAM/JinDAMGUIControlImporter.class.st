Class {
	#name : #JinDAMGUIControlImporter,
	#superclass : #JinGUIControlVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#category : #'JinDAM-Importers'
}

{ #category : #'as yet unclassified' }
JinDAMGUIControlImporter >> createInitializerForControl: aJinDAMAttribute with: aJinLabel [

	| initializer access parentAccess no |
	no := false.
	aJinLabel handle getTypeInfo properties
		select: [ :a | a name asLowercase endsWith: 'source' ]
		thenDo: [ :a | 
			| value |
			a name = #RecordSource ifTrue: [ 
				(aJinLabel handle propertyNamed: #RowSourceType) = 'Value List' 
					ifTrue: [ no := true ].
				self halt ].
			no ifTrue: [ 
				value := aJinLabel handle propertyNamed: a name.
				a name = '' ifTrue: [ self halt ].
				value = '' ifFalse: [ 
					value isString ifTrue: [ 
						(value beginsWith: '=') ifFalse: [ 
							(value asLowercase includesSubstring: 'select')
								ifTrue: [ " Here articulate loading of SQL query " ]
								ifFalse: [ 
									initializer := self state top invocables detect: [ :i | 
										               i isInitializer ].
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
											 typeReferenceName: { 
													 parentAccess.
													 { 
														 value.
														 #member } }
											 typeSymbol:
											 (self currentNamespace findSymbol:
												  self state top value name)
											 context: initializer).

									initializer addAccess: access ] ] ] ] ] ]
]

{ #category : #'as yet unclassified' }
JinDAMGUIControlImporter >> nodeToTypeReferenceName: aVBNode context: aContext [ 
	^ self referenceNameConverter toTypeReferenceName: aVBNode context: aContext 
]

{ #category : #'entry-point' }
JinDAMGUIControlImporter >> visitFormControl: anObject [

	| attribute |
	attribute := self instantiate: JinDAMAttribute.

	self createInitializerForControl: attribute with: anObject.

	anObject controlSource ifNotNil: [  ].
	"	frm dataSource: (self
			 typeReferenceName: source name
			 typeSymbol: (self currentNamespace findSymbol: source name)
			 context: frm).
"

	attribute visibility: #Public.
	attribute name: anObject name.
	attribute anchor: self state top anchor / #controls / anObject name.
	attribute typeReference: (self
			 instantiateReferenceForNames: { { 
					 anObject mappedTypeName.
					 #member } }
			 context: attribute
			 preferring: { #isType }).
	self state top addAttribute: attribute
]
