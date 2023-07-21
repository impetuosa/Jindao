"
I am a recordset. I represent the return of some query. 
I behave like a stream 
"
Class {
	#name : #JinRecordset,
	#superclass : #JinAccessObject,
	#instVars : [
		'lastReturnedValues',
		'table'
	],
	#category : #'Jindao-MSAccess-Database'
}

{ #category : #accessing }
JinRecordset >> atEnd [
	^ handle propertyNamed:#EOF
]

{ #category : #accessing }
JinRecordset >> close [
	handle dispatch:#Close
]

{ #category : #accessing }
JinRecordset >> currentValues [ 
	^ lastReturnedValues 
]

{ #category : #accessing }
JinRecordset >> fields [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Fields)
			factory:
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinAccessTableField;
				yourself);
		yourself
]

{ #category : #accessing }
JinRecordset >> next [
	self atEnd
		ifTrue: [ ^ self error: 'EOF' ].
	lastReturnedValues := self fields collect: [ :f | f name -> f value ].
	lastReturnedValues := lastReturnedValues asDictionary.
	handle dispatch: #MoveNext.
	^ lastReturnedValues
]

{ #category : #'as yet unclassified' }
JinRecordset >> nextPut: aCollection [ 
	handle dispatch:#AddNew.
	self fields collect: [ : f | f isComplexType ifFalse: [ f value:  (aCollection at: f name ) ]].
	handle dispatch:#Update. 
]

{ #category : #'as yet unclassified' }
JinRecordset >> table: aJinTable [
	table := aJinTable
]
