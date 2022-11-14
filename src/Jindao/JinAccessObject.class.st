Class {
	#name : #JinAccessObject,
	#superclass : #Object,
	#instVars : [
		'handle',
		'name'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinAccessObject class >> mappedTypeName [
	^ false 
]

{ #category : #'as yet unclassified' }
JinAccessObject class >> mapsWith: aTypeName [
	^ aTypeName = self mappedTypeName
]

{ #category : #'as yet unclassified' }
JinAccessObject class >> mooseName [
	^ self name copyReplaceAll: 'Jin' with: ''
]

{ #category : #'as yet unclassified' }
JinAccessObject >> handle [
	^ handle asCOMHandle
]

{ #category : #accessing }
JinAccessObject >> handle: aHandle [
	handle := aHandle.
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isAccessForm [
	^ false 
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isAccessProject [
	 ^ false 
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isControl [ 	^ false
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isCustomControl [
	^ false
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isLibrary [
	^ false
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isModelObject [

	^ false 
]

{ #category : #testing }
JinAccessObject >> isModule [

	^ false
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isQuery [
	^ false 
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isReferredBySymbol:  aSymbol [
 	self halt. 
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isRelation [ 
	^ false 
]

{ #category : #'as yet unclassified' }
JinAccessObject >> isTable [
	^ false 
]

{ #category : #'as yet unclassified' }
JinAccessObject >> mooseName [
	^ self  name 
]

{ #category : #accessing }
JinAccessObject >> name [
	^ name ifNil: [ name := handle propertyNamed: #Name]
]

{ #category : #'as yet unclassified' }
JinAccessObject >> nameWithoutSpaces [
	^ ((self name copyReplaceAll: ' ' with: '')
		copyReplaceAll: '/'
		with: '') copyReplaceAll: '-' with: '_'
]

{ #category : #accessing }
JinAccessObject >> printOn: aStream [
	aStream nextPutAll: self class name ; nextPut:$[ ; nextPutAll: self name ; nextPut: $]
]

{ #category : #accessing }
JinAccessObject >> typeGuid [
	^ handle getTypeInfo guid
]
