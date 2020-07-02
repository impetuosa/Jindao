Class {
	#name : #JinTableBody,
	#superclass : #JinBodyObject,
	#instVars : [
		'fields'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinTableBody >> attributes [
	^ handle propertyNamed: #Attributes
]

{ #category : #'as yet unclassified' }
JinTableBody >> connect [
	^ handle propertyNamed:#Connect 
]

{ #category : #'as yet unclassified' }
JinTableBody >> contents [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinTableBody >> createIndex: aString [
	| r |
	r := handle dispatch: #CreateIndex withArguments: {aString}.
	^ JinIndexBody new
		table: self;
		handle: r;
		yourself
]

{ #category : #'as yet unclassified' }
JinTableBody >> fields [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Fields)
			factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinAccessTableField;
				yourself);
		yourself
]

{ #category : #'as yet unclassified' }
JinTableBody >> indexes [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Indexes)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinIndexBody;
				scopedBy: self;
				yourself)
]

{ #category : #'as yet unclassified' }
JinTableBody >> recordset [
	^ JinRecordset new handle: (handle dispatch: #OpenRecordset)
]

{ #category : #'as yet unclassified' }
JinTableBody >> registerIndex: aJinIndexBody [
	(handle propertyNamed: #Indexes)
		dispatch: #Append
		withArguments: {aJinIndexBody handle}.
	(handle propertyNamed: #Indexes) dispatch: #Refresh
]

{ #category : #'as yet unclassified' }
JinTableBody >> relations [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinTableBody >> sourceTableName [
	^ handle propertyNamed: #SourceTableName 
]
