Class {
	#name : #JinSingleInstanceDispatchVisitor,
	#superclass : #JinMultiVisitor,
	#instVars : [
		'state',
		'control',
		'gui',
		'database',
		'code',
		'syntax',
		'project'
	],
	#category : #'Jindao-Subvisitor'
}

{ #category : #accessing }
JinSingleInstanceDispatchVisitor class >> default [
	^ self new
		code: JinCodeFirstCitizenVisitor new;
		database: JinDatabaseFirstCitizenVisitor new;
		gui: JinGUIFirstCitizenVisitor new;
		control: JinGUIControlVisitor new;
		syntax: VBProgramNodeVisitor new;
		project: JinProjectVisitor new;
		yourself
]

{ #category : #accessing }
JinSingleInstanceDispatchVisitor class >> nullVisitor [
	^ self new
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> code [
	^ code
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> code: aVisitor [
	code := aVisitor
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> control [
	^ control
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> control: aControl [
	control := aControl
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> database [
	^ database
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
	^ gui
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> gui: aGuiVisitor [
	gui := aGuiVisitor
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> project [
	^ project
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> project: aProjectVisitor [
	project := aProjectVisitor
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> syntax [
	^ syntax
]

{ #category : #'visit-first-objects' }
JinSingleInstanceDispatchVisitor >> syntax: aVisitor [
	syntax := aVisitor
]
