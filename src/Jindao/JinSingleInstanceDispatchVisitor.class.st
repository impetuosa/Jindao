Class {
	#name : #JinSingleInstanceDispatchVisitor,
	#superclass : #JinMultiVisitor,
	#instVars : [
		'state',
		'control',
		'gui',
		'database',
		'code',
		'syntax'
	],
	#category : #'Jindao-Subvisitor'
}

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> code [
	^ code ifNil: [ code := JinCodeFirstCitizenVisitor new ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> code: aVisitor [
	code := aVisitor
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> control [
	^ control ifNil: [ control := JinGUIControlVisitor new ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> control: aControl [
	control := aControl
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> database [
	^ database ifNil: [ database := JinDatabaseFirstCitizenVisitor new ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> database: aDBVisitor [
	database := aDBVisitor
]

{ #category : #'as yet unclassified' }
JinSingleInstanceDispatchVisitor >> firstClassCitizen [
	^ self
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> gui [
	^ gui ifNil: [ gui := JinGUIFirstCitizenVisitor new ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> gui: aGuiVisitor [
	gui := aGuiVisitor
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> syntax [
	^ syntax ifNil: [ syntax := VBProgramNodeVisitor new ]
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> syntax: aVisitor [
	syntax := aVisitor
]
