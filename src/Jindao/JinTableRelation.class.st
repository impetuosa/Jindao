"
I represent a fk relation in between to tables. I have one or many relation fields 
"
Class {
	#name : #JinTableRelation,
	#superclass : #JinAccessObject,
	#instVars : [
		'project'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinTableRelation >> acceptVisitor: aVisitor [
	aVisitor visitTableRelation: self
]

{ #category : #'as yet unclassified' }
JinTableRelation >> createField: aString [
	| field |
	field := handle dispatch: #CreateField withArguments: {aString}.
	(handle propertyNamed: #Fields)
		dispatch: #Append
		withArguments: {field}
]

{ #category : #'as yet unclassified' }
JinTableRelation >> createField: aSourceName to: aForeignName [
	| field |
	field := handle dispatch: #CreateField withArguments: {aSourceName}.
	field propertyNamed: #ForeignName put: aForeignName.
	(handle propertyNamed: #Fields)
		dispatch: #Append
		withArguments: {field}
]

{ #category : #'as yet unclassified' }
JinTableRelation >> fields [
	^ JinCollection newDefault
		base: 1;
		handle: (handle propertyNamed: #Fields)
			factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinRelationField;
				yourself);
		yourself
]

{ #category : #'as yet unclassified' }
JinTableRelation >> foreignTable [
	^ project tables
		detect: [ :t | t name = (handle propertyNamed: #ForeignTable) ]
]

{ #category : #'as yet unclassified' }
JinTableRelation >> foreignTableName [
	^ handle propertyNamed: #ForeignTable
]

{ #category : #'as yet unclassified' }
JinTableRelation >> isReflexiveRelation [
	^ self tableName = self foreignTableName 
]

{ #category : #'as yet unclassified' }
JinTableRelation >> printOn: aStream [
	aStream
		nextPutAll: self tableName;
		nextPut: $[;
		nextPutAll: (',' join: (self fields collect: #sourceName));
		nextPut: $];
		nextPutAll: '=>';
		nextPutAll: self foreignTableName;
		nextPut: $[;
		nextPutAll: (',' join: (self fields collect: #foreignName));
		nextPut: $]
]

{ #category : #'as yet unclassified' }
JinTableRelation >> scopedBy: aJinAccessProject [
	project := aJinAccessProject
]

{ #category : #'as yet unclassified' }
JinTableRelation >> table [
	^ project tables
		detect: [ :t | t name = (handle propertyNamed: #Table) ]
]

{ #category : #'as yet unclassified' }
JinTableRelation >> tableName [
	^ handle propertyNamed:#Table 
]
