Class {
	#name : #JinDAMDatabaseImporter,
	#superclass : #JinDatabaseFirstCitizenVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#instVars : [
		'dbtypes'
	],
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
				         instantiateReferenceForNames: { {aString . #member} }
				         context: aJinDAMAttribute
				         preferring: { #isEnumEntry }) ].
	ref := self instantiate: JinDAMTypeReference.
	ref candidate: type.
	ref candidateAnchor: type typeEnumReference candidateAnchor .
	ref context: aJinDAMAttribute. 
	^ ref
]

{ #category : #'as yet unclassified' }
JinDAMDatabaseImporter >> dbtypes [
	^ dbtypes ifNil: [ dbtypes := Dictionary new ] 
]

{ #category : #visiting }
JinDAMDatabaseImporter >> visitQuery: aJinQuery [

	| tab field |
	tab := self instantiate: JinDAMQuery.
	tab superClassReference: (self
			 typeReferenceName: 'QueryDefs'
			 typeSymbol: (self currentNamespace findSymbol: #QueryDefs)
			 context: tab).
	tab name: aJinQuery name.
	tab anchor: self state top anchor / #tables / aJinQuery name.
	self state top addType: tab.

	aJinQuery fields do: [ :f | 
		field := self instantiate: JinDAMTableField.
		field name: f name.
		field size: f size.
		field sourceTableName: f sourceTableName.
		field typeReference: (self
				 dbTypeReferenceName: f typeName
				 typeSymbol: (self currentNamespace findSymbol: f typeName)
				 context: field).
		tab addAttribute: field ].
	aJinQuery ensureUnload
]

{ #category : #visiting }
JinDAMDatabaseImporter >> visitTable: aJinTable [

	| tab field |
	tab := self instantiate: JinDAMTable.
	tab superClassReference: (self
			 typeReferenceName: 'TableDefs'
			 typeSymbol: (self currentNamespace findSymbol: #TableDefs)
			 context: tab).
	tab name: aJinTable name.
	tab anchor: self state top anchor / #tables / aJinTable name.
	self state top addType: tab.

	aJinTable fields do: [ :f | 
		field := self instantiate: JinDAMTableField.
		field name: f name.
		field size: f size.
		field sourceTableName: f sourceTableName.
		field typeReference: (self
				 dbTypeReferenceName: f typeName
				 typeSymbol: (self currentNamespace findSymbol: f typeName)
				 context: field).
		tab addAttribute: field ].
	aJinTable ensureUnload
]

{ #category : #visiting }
JinDAMDatabaseImporter >> visitTableRelation: aJinTableRelation [

	| relation |
	relation := self instantiate: JinDAMTableRelation.
	relation sourceTable: aJinTableRelation tableName.
	relation foreignTable: aJinTableRelation foreignTableName.
	aJinTableRelation fields do: [ :f | 
		relation addMatch: f sourceName to: f foreignName ]
]
