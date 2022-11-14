"
I represent a relationship field. I aput together a field of one table with the field name of other table 
"
Class {
	#name : #JinRelationField,
	#superclass : #JinAccessObject,
	#instVars : [
		'project'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinRelationField >> foreignName [ 
	^ handle propertyNamed:#ForeignName 
]

{ #category : #'as yet unclassified' }
JinRelationField >> printOn: aStream [
	aStream
		nextPutAll: self sourceName;
		nextPutAll: '>>';
		nextPutAll: self foreignName
]

{ #category : #'as yet unclassified' }
JinRelationField >> scopedBy: aProject [
	project := aProject
]

{ #category : #'as yet unclassified' }
JinRelationField >> sourceName [ 
	^ handle propertyNamed:#Name 
]
