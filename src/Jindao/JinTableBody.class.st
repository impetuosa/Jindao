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
JinTableBody >> sourceTableName [
	^ handle propertyNamed: #SourceTableName 
]
