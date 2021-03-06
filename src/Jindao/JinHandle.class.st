"
JinHandle gets together the access to access by proxifying COMDispatch and allowign some leverage. 

JinHandle is mean to be polymorphic with COMDispatch .
"
Class {
	#name : #JinHandle,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #'Jindao-Core'
}

{ #category : #properties }
JinHandle >> dispatch: aFunctionName [ 
	^ self dispatch: aFunctionName withArguments: #().
]

{ #category : #properties }
JinHandle >> dispatch: aFunctionName withArguments: arguments [
	^ handle dispatch: aFunctionName withArguments: arguments
]

{ #category : #'as yet unclassified' }
JinHandle >> getTypeInfo [
	^ handle getTypeInfo
]

{ #category : #properties }
JinHandle >> handle: aHandle [
 handle := aHandle 
]

{ #category : #'as yet unclassified' }
JinHandle >> properties [
	^ handle properties
]

{ #category : #properties }
JinHandle >> propertyNamed: aPropName [
	^ self propertyNamed: aPropName withArguments: #()
]

{ #category : #properties }
JinHandle >> propertyNamed: aPropName put: aValue [
	^ handle propertyNamed: aPropName put: aValue
]

{ #category : #properties }
JinHandle >> propertyNamed: aPropName withArguments: arguments [
	^ handle propertyNamed: aPropName withArguments: arguments
]
