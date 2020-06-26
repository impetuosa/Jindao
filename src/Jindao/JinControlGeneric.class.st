"
I am here to work as a minimal-functionality handle .
"
Class {
	#name : #JinControlGeneric,
	#superclass : #JinControl,
	#category : #'Jindao-FormControls'
}

{ #category : #'as yet unclassified' }
JinControlGeneric class >> mappedTypeName [
	" The generic control is the default, so it should not match with anyname "
	^ self 
]

{ #category : #'as yet unclassified' }
JinControlGeneric >> controlType [
	^ handle propertyNamed: #ControlType
]

{ #category : #'as yet unclassified' }
JinControlGeneric >> isCustomControl [
	^ true
]

{ #category : #printing }
JinControlGeneric >> printOn: aStream [
	aStream
		nextPutAll: 'JinControlGeneric[';
		nextPutAll: handle getTypeInfo name;
		nextPut: $]
]

{ #category : #'as yet unclassified' }
JinControlGeneric >> propertiesToInfuse [
	self assert: handle getTypeInfo name = '_CustomControl'.
	^ self properties collect: #name
]

{ #category : #'as yet unclassified' }
JinControlGeneric >> section [
	^ handle propertyNamed:#Section
]
