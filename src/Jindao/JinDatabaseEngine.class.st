"
I a represent the DBEngine main object. I have access to workspaces, relations etc. 
"
Class {
	#name : #JinDatabaseEngine,
	#superclass : #JinAccessObject,
	#instVars : [
		'project'
	],
	#category : #'Jindao-MSAccess-Database'
}

{ #category : #'as yet unclassified' }
JinDatabaseEngine >> createQueryDefNamed: aName sql: aSql [ 
	handle dispatch: #CreateQueryDef withArguments: { aName . aSql }.
	
]

{ #category : #'as yet unclassified' }
JinDatabaseEngine >> createRelation: aJinTableRelation [
	| relation |
	relation := handle
		dispatch: #CreateRelation
		withArguments:
			{aJinTableRelation name.
			aJinTableRelation tableName.
			aJinTableRelation foreignTableName}.
	relation := JinTableRelation new
		scopedBy: project;
		handle: relation.
	aJinTableRelation fields
		do: [ :f | relation createField: f sourceName to: f foreignName ].
	(handle propertyNamed: #Relations)
		dispatch: #Append
		withArguments: {relation handle}
]

{ #category : #'as yet unclassified' }
JinDatabaseEngine >> createRemoteTableNamed: aName fields: fields attributes: anAttributeNumber sourceTableName: anOtherName connect: aConnectionString [
	| def fieldsProperty |
	" For understanding this magic numbers, go to JinTable isAttachedODBC and others ."
	self assert: 537001984 = anAttributeNumber.
	def := handle
		dispatch: #CreateTableDef
		withArguments:
			{aName }.
	fieldsProperty := def propertyNamed: #Fields.
	fields
		do: [ :f | 
			| newField |
			newField := def
				dispatch: #CreateField
				withArguments:
					{f name.
					f type}.
			fieldsProperty dispatch: #Append withArguments: {newField} ].
	(handle propertyNamed: #TableDefs)
		dispatch: #Append
		withArguments: {def}.
	(handle propertyNamed: #TableDefs) dispatch: #Refresh.

	"
Linking 
acLink 	2
		DoCmd.TransferDatabase acLink, 'ODBC Database', cn, acTable, rs!TABLE_NAME, sLocalName
	"

	project application
		command: #TransferDatabase
		withArguments:
			{2.
			'ODBC'.
			aConnectionString.
			JinTable typeNumber.
			anOtherName.
			aName}
]

{ #category : #'as yet unclassified' }
JinDatabaseEngine >> createTableNamed: aName fields: fields attributes: anAttributeNumber sourceTableName: anOtherName connect: aConnectionString [
	| def fieldsProperty |
	def := handle
		dispatch: #CreateTableDef
		withArguments:
			{aName.
			anAttributeNumber.
			anOtherName.
			aConnectionString}.
	fieldsProperty := def propertyNamed: #Fields.
	fields
		do: [ :f | 
			| newField |
			newField := def
				dispatch: #CreateField
				withArguments:
					{f name.
					f type}.
			fieldsProperty dispatch: #Append withArguments: {newField} ].
	(handle propertyNamed: #TableDefs)
		dispatch: #Append
		withArguments: {def}
]

{ #category : #'as yet unclassified' }
JinDatabaseEngine >> project: aJinAccessProject [
	project := aJinAccessProject
]

{ #category : #'as yet unclassified' }
JinDatabaseEngine >> relations [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Relations)
		factory:
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinAccessObject ;
				yourself)
]

{ #category : #'as yet unclassified' }
JinDatabaseEngine >> transformToBestFitAttirbute: anAttribute [  
"
dbAttachedODBC	536870912	Linked ODBC database table.
dbAttachedTable	1073741824	Linked non-ODBC database table.
dbAttachExclusive	65536	Opens a linked Microsoft Access database engine table for exclusive use.
dbAttachSavePWD	131072	Saves user ID and password for linked remote table.
dbHiddenObject	1	Hidden table (for temporary use).
dbSystemObject	-2147483646	System table.
"	
 536870912 | 131072

]
