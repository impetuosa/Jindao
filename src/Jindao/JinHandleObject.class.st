Class {
	#name : #JinHandleObject,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #Jindao
}

{ #category : #accessing }
JinHandleObject >> handle: aHandle [
	handle := aHandle
]

{ #category : #accessing }
JinHandleObject >> name [
	^ handle propertyNamed: #Name
]
