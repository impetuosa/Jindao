"
a group level defines some kind of composition and or agreggation in a report or complex form. 
"
Class {
	#name : #JinGroupLevel,
	#superclass : #JinAccessObject,
	#instVars : [
		'level'
	],
	#category : #'Jindao-MSAccess-Widgets'
}

{ #category : #'as yet unclassified' }
JinGroupLevel >> controlSource [
	^ handle propertyNamed: #ControlSource
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> controlSource: aValue [ 
	^ handle propertyNamed: #ControlSource put: aValue
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> groupFooter [
	^ handle propertyNamed: #GroupFooter
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> groupFooter: aValue [
	^ handle propertyNamed: #GroupFooter put: aValue
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> groupHeader [
	^ handle propertyNamed: #GroupHeader
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> groupHeader: aValue [
	^ handle propertyNamed: #GroupHeader put: aValue
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> groupInterval [
	^ handle propertyNamed: #GroupInterval
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> groupInterval: aValue [
	^ handle propertyNamed: #GroupInterval put: aValue
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> groupOn [
	^ handle propertyNamed: #GroupOn
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> groupOn: aValue [
	^ handle propertyNamed: #GroupOn put: aValue
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> keepTogether [
	^ handle propertyNamed: #KeepTogether
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> keepTogether: aValue [
	^ handle propertyNamed: #KeepTogether put: aValue
]

{ #category : #accessing }
JinGroupLevel >> level: anId [
	level := anId
]

{ #category : #accessing }
JinGroupLevel >> printOn: aStream [
	aStream
		nextPutAll: 'JinGroupLevel[';
		nextPutAll: level asString;
		nextPut: $]
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> sortOrder [
	^ handle propertyNamed: #SortOrder 
]

{ #category : #'as yet unclassified' }
JinGroupLevel >> sortOrder: aValue [
	^ handle propertyNamed: #SortOrder put: aValue
]
