"
I am a field of table. I know how to get  my name and i know if i am complex 
"
Class {
	#name : #JinAccessTableField,
	#superclass : #JinAccessObject,
	#instVars : [
		'parent',
		'properties'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinAccessTableField class >> fieldTypeMapping: aNumber [
	^ {(101 -> 'dbAttachment').
	(16 -> 'dbBigInt').
	(9 -> 'dbBinary').
	(1 -> 'dbBoolean').
	(2 -> 'dbByte').
	(18 -> 'dbChar').
	(102 -> 'dbComplexByte').
	(108 -> 'dbComplexDecimal').
	(106 -> 'dbComplexDouble').
	(107 -> 'dbComplexGUID').
	(103 -> 'dbComplexInteger').
	(104 -> 'dbComplexLong').
	(105 -> 'dbComplexSingle').
	(109 -> 'dbComplexText').
	(5 -> 'dbCurrency').
	(8 -> 'dbDate').
	(20 -> 'dbDecimal').
	(7 -> 'dbDouble').
	(21 -> 'dbFloat').
	(15 -> 'dbGUID').
	(3 -> 'dbInteger').
	(4 -> 'dbLong').
	(11 -> 'dbLongBinary').
	(12 -> 'dbMemo').
	(19 -> 'dbNumeric').
	(6 -> 'dbSingle').
	(10 -> 'dbText').
	(22 -> 'dbTime').
	(23 -> 'dbTimeStamp').
	(17 -> 'dbVarBinary')} asDictionary at: aNumber ifAbsent: [ 'UnknownCode ', aNumber asString ]
]

{ #category : #visiting }
JinAccessTableField >> acceptVisitor: aVisitor [
	aVisitor visitAccessTableField: self
]

{ #category : #'as yet unclassified' }
JinAccessTableField >> isComplexType [
	^ handle propertyNamed: #IsComplex
]

{ #category : #'as yet unclassified' }
JinAccessTableField >> printOn: aStream [
	aStream
		nextPutAll:
			('{1} : {2}({3})'
				format:
					{self name.
					self typeName.
					self size})
]

{ #category : #'as yet unclassified' }
JinAccessTableField >> properties [
	^ properties
		ifNil: [ 
			^ properties
				ifNil: [ properties := JinCollection newDefault
						handle: (handle propertyNamed: #Properties)
						factory: (JinFirstClassCitizenModelFactory defaultFor: JinBodyObject) ] ]
]

{ #category : #'as yet unclassified' }
JinAccessTableField >> size [
	^  handle propertyNamed: #Size
]

{ #category : #'as yet unclassified' }
JinAccessTableField >> sourceTableName [
	^ handle propertyNamed: #SourceTable 
]

{ #category : #'as yet unclassified' }
JinAccessTableField >> type [
	^ handle propertyNamed: #Type
]

{ #category : #'as yet unclassified' }
JinAccessTableField >> typeName [
	^ self class fieldTypeMapping: self type
]

{ #category : #'as yet unclassified' }
JinAccessTableField >> value [
	^ handle propertyNamed: #Value
]

{ #category : #'as yet unclassified' }
JinAccessTableField >> value: aValue [
	aValue ifNotNil: [ handle propertyNamed: #Value put: aValue ]
]
