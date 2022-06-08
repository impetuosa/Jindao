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
	#category : #'Jindao-Core'
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
	^ self body attributes 
]

{ #category : #'as yet unclassified' }
JinTable >> children [

	^ self fields
]

{ #category : #'as yet unclassified' }
JinTable >> connect [
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
	^ self body createIndex: aString
]

{ #category : #'as yet unclassified' }
JinTable >> exportToFolder: aFolder [
	^ project exportXml: self toFolder: aFolder
]

{ #category : #'as yet unclassified' }
JinTable >> fields [
	^ self body fields 
]

{ #category : #'as yet unclassified' }
JinTable >> indexes [
	^ self body indexes 
]

{ #category : #'as yet unclassified' }
JinTable >> isAttachedAndSavesPassword [
	" dbAttachSavePWD	131072	Saves user ID and password for linked remote table."

	^ (self attributes & 131072) = 131072
	

]

{ #category : #'as yet unclassified' }
JinTable >> isAttachedExclusively [
	" dbAttachExclusive	65536	Opens a linked Microsoft Access database engine table for exclusive use."

	^ (self attributes & 65536) = 65536
	

]

{ #category : #'as yet unclassified' }
JinTable >> isAttachedNonODBC [
	" dbAttachedTable	1073741824	Linked non-ODBC database table."

	^ (self attributes & 1073741824) = 1073741824
	
]

{ #category : #'as yet unclassified' }
JinTable >> isAttachedODBC [
	" dbAttachedODBC	536870912	Linked ODBC database table."

	^ (self attributes & 536870912) = 536870912
]

{ #category : #'as yet unclassified' }
JinTable >> isHidden [ 
	" dbHiddenObject	1	Hidden table (for temporary use)."

	^ (self attributes & 1) = 1
	


]

{ #category : #'as yet unclassified' }
JinTable >> isLocal [
	^ self isRemote not 
]

{ #category : #'as yet unclassified' }
JinTable >> isRemote [
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
	^ self body relations
]

{ #category : #'as yet unclassified' }
JinTable >> sourceTableName [
	^ self body sourceTableName 
]
