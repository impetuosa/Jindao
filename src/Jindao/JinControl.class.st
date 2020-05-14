"
A Jin control represents a Form control, such as a textbox, combobox, etc. 

In this hiearchy we have the generated control, used as super class of generated classes, a generic class that implement some basic stuff for all the controls. 
"
Class {
	#name : #JinControl,
	#superclass : #JinProtoHandleObject,
	#instVars : [
		'parent'
	],
	#category : #'Jindao-DomainObjects-FormControls'
}

{ #category : #'as yet unclassified' }
JinControl >> acceptVisitor: aVisitor [
	aVisitor visitControl: self
]

{ #category : #'as yet unclassified' }
JinControl >> containingWidget [
	^ parent 
]

{ #category : #'as yet unclassified' }
JinControl >> controlName [
	<doNotOverride>
	^ handle propertyNamed: #ControlName
]

{ #category : #'as yet unclassified' }
JinControl >> handle: aCOMDispatchInstance [ 
	handle := aCOMDispatchInstance
]

{ #category : #'as yet unclassified' }
JinControl >> jinParent [
	^ parent 
]

{ #category : #'as yet unclassified' }
JinControl >> parent: aParent [ 
	parent := aParent 
]

{ #category : #'as yet unclassified' }
JinControl >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $[;
		nextPutAll: self controlName;
		nextPut: $]
]

{ #category : #'as yet unclassified' }
JinControl >> properties [
	<doNotOverride> 
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Properties)
		factory: (JinInstanceFactory defaultFor: JinHandleObject)
]
