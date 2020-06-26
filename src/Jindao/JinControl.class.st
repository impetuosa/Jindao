"
A Jin control represents a Form control, such as a textbox, combobox, etc. 

In this hiearchy we have the generated control, used as super class of generated classes, a generic class that implement some basic stuff for all the controls. 
"
Class {
	#name : #JinControl,
	#superclass : #JinAccessObject,
	#instVars : [
		'properties',
		'scope'
	],
	#category : #'Jindao-FormControls'
}

{ #category : #'as yet unclassified' }
JinControl >> acceptVisitor: aVisitor [
	aVisitor visitFormControl: self
]

{ #category : #'as yet unclassified' }
JinControl >> containingWidget [
	^ self parent 
]

{ #category : #'as yet unclassified' }
JinControl >> controlName [
	<doNotOverride>
	^ handle propertyNamed: #ControlName
]

{ #category : #'as yet unclassified' }
JinControl >> controlTypeNumber [
	^ handle propertyNamed: #ControlType
]

{ #category : #'as yet unclassified' }
JinControl >> createIn: aJinForm [
	| parentName |
	parentName := self parentName.
	^ parentName = aJinForm name
		ifTrue: [ aJinForm
				createControl: self name
				type: self controlType
				section: self sectionNumber ]
		ifFalse: [ aJinForm
				createControl: self name
				type: self controlType
				section: self sectionNumber
				parent: parentName ]
]

{ #category : #'as yet unclassified' }
JinControl >> isCustomControl [
	^ false
]

{ #category : #'as yet unclassified' }
JinControl >> isEmptyCell [
	^ false 
]

{ #category : #'as yet unclassified' }
JinControl >> parent [
	^ handle propertyNamed: #Parent
]

{ #category : #'as yet unclassified' }
JinControl >> parentName [
	^ self parent propertyNamed: #Name
]

{ #category : #'as yet unclassified' }
JinControl >> parentObject [
	^ scope resolveObjectFor: self parent
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
	^ properties
		ifNil: [ properties := JinCollection newDefault
				handle: (handle propertyNamed: #Properties)
					factory: self propertiesFactory;
				yourself ]
]

{ #category : #'as yet unclassified' }
JinControl >> propertiesFactory [
	^ JinRemotesFactory newDefaultAccessPropertyFactory
]

{ #category : #'as yet unclassified' }
JinControl >> propertiesToInfuse [
	^ self class propertiesToInfuse
]

{ #category : #'as yet unclassified' }
JinControl >> scopedBy: aFormOrReport [
	scope := aFormOrReport
]

{ #category : #'as yet unclassified' }
JinControl >> sectionNumber [
	^ handle propertyNamed:#Section 
]
