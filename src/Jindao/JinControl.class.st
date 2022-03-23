"
A Jin control represents a Form control, such as a textbox, combobox, etc. 

In this hiearchy we have the generated control, used as super class of generated classes, a generic class that implement some basic stuff for all the controls. 
"
Class {
	#name : #JinControl,
	#superclass : #JinAccessObject,
	#instVars : [
		'properties',
		'scope',
		'documentedProperties'
	],
	#category : #'Jindao-FormControls'
}

{ #category : #'as yet unclassified' }
JinControl class >> layoutNameFor: aTypeNumber [
	^ {#None . #Stacked . #Tabular} at: aTypeNumber + 1
]

{ #category : #'as yet unclassified' }
JinControl >> acceptVisitor: aVisitor [
	^ aVisitor visitCustomControl: self
]

{ #category : #'as yet unclassified' }
JinControl >> children [
	^ self documentedProperties 
]

{ #category : #'initialize-release' }
JinControl >> close [

]

{ #category : #'as yet unclassified' }
JinControl >> componentKnownProperties [

	^ self class componentKnownProperties
	  , { 'LayoutID'. 'Section'. 'LayoutName' }
]

{ #category : #'as yet unclassified' }
JinControl >> containingWidget [
	^ self parentObject 
]

{ #category : #'as yet unclassified' }
JinControl >> controlName [
	<doNotOverride>
	^ handle propertyNamed: #ControlName
]

{ #category : #'property - generated' }
JinControl >> controlSource [

	^ handle getDispatchType properties
		  detect: [ :e | e name = #ControlSource ]
		  ifFound: [ handle propertyNamed: #ControlSource ]
		  ifNone: [ nil ]
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
JinControl >> documentedProperties [

	^ documentedProperties ifNil: [ 
		  documentedProperties := self componentKnownProperties collect: [ 
			                          :p | 
			                          JinAccessFastProperty new
				                          accessObject: self;
				                          name: p;
				                          yourself ] ]
]

{ #category : #'as yet unclassified' }
JinControl >> isControl [
	^true
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
JinControl >> layout [
	^ 0
]

{ #category : #'as yet unclassified' }
JinControl >> layoutID [
	^ 0
]

{ #category : #'as yet unclassified' }
JinControl >> layoutName [
	^ self layoutNameFor: self layout
]

{ #category : #'as yet unclassified' }
JinControl >> layoutNameFor: typr [
	^ self class layoutNameFor: typr
]

{ #category : #'as yet unclassified' }
JinControl >> mappedTypeName [
	^ self class mappedTypeName
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
	^ properties ifNil: [ 
			properties := JinCollection newDefault
				handle: (handle propertyNamed: #Properties)
				factory: self propertiesFactory;
				yourself 
	]
]

{ #category : #'as yet unclassified' }
JinControl >> propertiesFactory [
	^ JinRemotesFactory newDefaultAccessPropertyFactory
]

{ #category : #'as yet unclassified' }
JinControl >> propertyNamed: asd [
]

{ #category : #'as yet unclassified' }
JinControl >> scopedBy: aFormOrReport [
	scope := aFormOrReport
]

{ #category : #'as yet unclassified' }
JinControl >> scopingName [
	^ scope name
]

{ #category : #'as yet unclassified' }
JinControl >> sectionNumber [
	^ handle propertyNamed:#Section 
]
