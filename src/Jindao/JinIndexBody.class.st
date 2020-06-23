Class {
	#name : #JinIndexBody,
	#superclass : #JinBodyObject,
	#instVars : [
		'fields'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinIndexBody >> acceptVisitor: aVisitor [
	aVisitor visitIndex: self
]

{ #category : #accessing }
JinIndexBody >> clustered [
	^ handle propertyNamed: #Clustered
]

{ #category : #accessing }
JinIndexBody >> clustered: aBoolean [
	handle propertyNamed: #Clustered put: aBoolean
]

{ #category : #'as yet unclassified' }
JinIndexBody >> createField: aFieldName [
	^ (handle propertyNamed: #Fields)
		dispatch: #Append
		withArguments: {(handle dispatch: #CreateField withArguments: {aFieldName})}
]

{ #category : #accessing }
JinIndexBody >> fields [
	^ JinCollection newDefault
		base: 1;
		handle: (handle propertyNamed: #Fields)
			factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinAccessTableField;
				yourself);
		yourself
]

{ #category : #accessing }
JinIndexBody >> foreign [
	^ handle propertyNamed: #Foreign
]

{ #category : #accessing }
JinIndexBody >> foreign: aBoolean [
	handle propertyNamed: #Foreign put: aBoolean
]

{ #category : #accessing }
JinIndexBody >> ignoreNulls [
	^ handle propertyNamed: #IgnoreNulls
]

{ #category : #accessing }
JinIndexBody >> ignoreNulls: aBoolean [
	handle propertyNamed: #IgnoreNulls put: aBoolean
]

{ #category : #accessing }
JinIndexBody >> isForeign [
	^ self foreign
]

{ #category : #accessing }
JinIndexBody >> primaryKey [
	^ handle propertyNamed: #Primary
]

{ #category : #accessing }
JinIndexBody >> primaryKey: aBoolean [
	handle propertyNamed: #Primary put: aBoolean
]

{ #category : #accessing }
JinIndexBody >> required [
	^ handle propertyNamed: #Required
]

{ #category : #accessing }
JinIndexBody >> required: aBoolean [
	handle propertyNamed: #Required put: aBoolean
]

{ #category : #accessing }
JinIndexBody >> unique [
	^ handle propertyNamed: #Unique
]

{ #category : #accessing }
JinIndexBody >> unique: aBoolean [
	handle propertyNamed: #Unique put: aBoolean
]
