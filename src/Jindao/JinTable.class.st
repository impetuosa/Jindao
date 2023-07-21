"
dbAttachedODBC	536870912	Linked ODBC database table.
dbAttachedTable	1073741824	Linked non-ODBC database table.
dbAttachExclusive	65536	Opens a linked Microsoft Access database engine table for exclusive use.
dbAttachSavePWD	131072	Saves user ID and password for linked remote table.
dbHiddenObject	1	Hidden table (for temporary use).
dbSystemObject	-2147483646	System table.

"
Class {
	#name : #JinTable,
	#superclass : #JinModelObject,
	#category : #'Jindao-MSAccess-Database'
}

{ #category : #accessing }
JinTable class >> typeNumber [
	^ 0
]

{ #category : #'as yet unclassified' }
JinTable >> acceptVisitor: aVisitor [
	^ aVisitor visitTable: self
]

{ #category : #'as yet unclassified' }
JinTable >> attributes [

	<doc: 'Returns the attributes of the table '>
	^ self body attributes
]

{ #category : #'as yet unclassified' }
JinTable >> children [

	^ self fields
]

{ #category : #'as yet unclassified' }
JinTable >> connect [

	<doc: 'Connects to the table. Required to open a recordset.'>
	^ self body connect
]

{ #category : #'as yet unclassified' }
JinTable >> contentHash [

	^ (MD5 hashMessage: 'Table ' , self name , self fields size asString)
		  hex
]

{ #category : #'as yet unclassified' }
JinTable >> contents [
	^ self body contents
]

{ #category : #'as yet unclassified' }
JinTable >> createIndex: aString [
	
	<doc: 'Creates an index over this table named as given by the parameter. '>
	^ self body createIndex: aString
]

{ #category : #'as yet unclassified' }
JinTable >> exportToFolder: aFolder [
	^ project exportXml: self toFolder: aFolder
]

{ #category : #'as yet unclassified' }
JinTable >> fields [

	<doc: 'Returns the fields of the table '>
	^ self body fields
]

{ #category : #'as yet unclassified' }
JinTable >> indexes [

	<doc: 'Returns all the indexes defined in the table'>
	^ self body indexes
]

{ #category : #'as yet unclassified' }
JinTable >> isAttachedAndSavesPassword [

	<doc:
	'Returns if the table is or not dbAttachSavePWD	131072	Saves user ID and password for linked remote table.'>
	^ self attributes & 131072 = 131072
]

{ #category : #'as yet unclassified' }
JinTable >> isAttachedExclusively [

	<doc:
	'Returns if the table is or not dbAttachExclusive	65536	Opens a linked Microsoft Access database engine table for exclusive use.'>
	^ self attributes & 65536 = 65536
]

{ #category : #'as yet unclassified' }
JinTable >> isAttachedNonODBC [
<doc:
	'Returns if the table is or not dbAttachedTable	1073741824	Linked non-ODBC database table'>
	^ (self attributes & 1073741824) = 1073741824
	
]

{ #category : #'as yet unclassified' }
JinTable >> isAttachedODBC [
	<doc:
	'Returns if the table is or not dbAttachedODBC	536870912	 Linked ODBC database table. '>
	^ self attributes & 536870912 = 536870912
]

{ #category : #'as yet unclassified' }
JinTable >> isHidden [

	<doc: 'Returns if the table is or not visible '>
	^ self attributes & 1 = 1
]

{ #category : #'as yet unclassified' }
JinTable >> isLocal [

	<doc:
	'Returns if the table stored in the database where we got the object from'>
	^ self isRemote not
]

{ #category : #testing }
JinTable >> isReferredBySymbol: aJinNSNameEntry [

	^ aJinNSNameEntry kind isTable and: [ 
		  aJinNSNameEntry referersTo: self name ]
]

{ #category : #'as yet unclassified' }
JinTable >> isRemote [

	<doc: 'Returns if the table stored in a remote database '>
	^ self isAttachedODBC or: [ self isAttachedNonODBC ]
]

{ #category : #'as yet unclassified' }
JinTable >> isSystemTable [
	"dbSystemObject	-2147483646	System table."

	^ (self attributes & -2147483646) > 0
]

{ #category : #'as yet unclassified' }
JinTable >> isTable [ 
	 ^ true 
]

{ #category : #accessing }
JinTable >> privateLoadBodyObject [
	^ (project openTable: self)
]

{ #category : #'as yet unclassified' }
JinTable >> recordset [

	<doc:
	'Returns a Recordset accessing all the data of this table. Must connect before usign. '>
	self assert: self isLocal.
	^ self body recordset
		  table: self;
		  yourself
]

{ #category : #'as yet unclassified' }
JinTable >> registerIndex: aJinIndexBody [
	self close.
	self body registerIndex: aJinIndexBody
]

{ #category : #'as yet unclassified' }
JinTable >> relations [

	<doc: 'Returns all the relations (FK) with other tables '>
	^ self body relations
]

{ #category : #'as yet unclassified' }
JinTable >> sourceTableName [
	^ self body sourceTableName 
]
