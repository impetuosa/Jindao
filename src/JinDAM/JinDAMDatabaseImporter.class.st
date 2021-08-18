Class {
	#name : #JinDAMDatabaseImporter,
	#superclass : #JinDatabaseFirstCitizenVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#category : #'JinDAM-Importers'
}

{ #category : #'as yet unclassified' }
JinDAMDatabaseImporter >> dbTypeReferenceName: aString typeSymbol: aCollection context: aJinDAMAttribute [

	| enums type ref |
	enums := aCollection select: [ :e | e kind isEnumEntry ].
	self assert: enums size = 1.

	type := self dbtypes at: enums first name , aString ifAbsentPut: [ 
		        type := self instantiate: JinDAMDBType.
		        type name: aString.
		        type typeEnumReference: (self
				         instantiateReferenceForNames: { aString }
				         context: aJinDAMAttribute
				         preferring: { #isEnumEntry }) ].
	ref := self instantiate: JinDAMTypeReference.
	ref candidate: type.
	ref candidateAnchor: type typeEnumReference anchor.
	^ ref
]

{ #category : #'as yet unclassified' }
JinDAMDatabaseImporter >> dbtypes [

	| dbtypes |
	^ dbtypes ifNil: [ dbtypes := Dictionary new ] 
]

{ #category : #visiting }
JinDAMDatabaseImporter >> visitQuery: aJinQuery [ 
	self halt. 
]

{ #category : #visiting }
JinDAMDatabaseImporter >> visitTable: aJinTable [

	| tab field |
	tab := self instantiate: JinDAMTable.
	tab name: aJinTable name.
	tab anchor: self state top anchor / #tables / aJinTable name.
	self state top addType: tab.

	aJinTable fields do: [ :f | 
		field := self instantiate: JinDAMAttribute.
		field name: f name.
		field typeReference: (self
				 dbTypeReferenceName: f typeName
				 typeSymbol: (self currentNamespace findSymbol: f typeName)
				 context: field).
		tab addAttribute: field ].
	aJinTable ensureUnload
]

{ #category : #visiting }
JinDAMDatabaseImporter >> visitTableRelation: aJinTableRelation [
	self halt. 
]
