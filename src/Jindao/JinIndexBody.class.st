Class {
	#name : #JinIndexBody,
	#superclass : #JinBodyObject,
	#instVars : [
		'fields'
	],
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinIndexBody >> clustered: aBoolean [
	handle propertyNamed: #Clustered put: aBoolean
]

{ #category : #accessing }
JinIndexBody >> fields [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Fields)
			factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinAccessTableField;
				yourself);
		yourself
]

{ #category : #accessing }
JinIndexBody >> foreign: aBoolean [
	handle propertyNamed: #Foreign put: aBoolean
]

{ #category : #accessing }
JinIndexBody >> ignoreNulls: aBoolean [
	handle propertyNamed: #IgnoreNulls put: aBoolean
]

{ #category : #accessing }
JinIndexBody >> primaryKey: aBoolean [
	handle propertyNamed: #PrimaryKey put: aBoolean
]

{ #category : #accessing }
JinIndexBody >> required: aBoolean [
	handle propertyNamed: #Required put: aBoolean
]

{ #category : #accessing }
JinIndexBody >> unique: aBoolean [
	handle propertyNamed: #Unique put: aBoolean
]
