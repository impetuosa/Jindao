"
I represent a access project. I am instantiated by the access application object. 
I am a first access to collections of defined elements 
"
Class {
	#name : #JinAccessProject,
	#superclass : #Object,
	#instVars : [
		'programHandle',
		'dataHandle',
		'application'
	],
	#category : #'Jindao-DomainObjects'
}

{ #category : #'initialize-release' }
JinAccessProject >> close [
	application closeProject: self. 
]

{ #category : #accessing }
JinAccessProject >> forms [
	^ JinCollection new
		handle: (programHandle propertyNamed: #AllForms)
		factory:
			((JinInstanceFactory defaultFor: JinForm)
				project: self;
				yourself)
]

{ #category : #'initialize-release' }
JinAccessProject >> handle: aCOMDispatchInstance dataHandle: aDataHandle application: anApplication [
	application := anApplication .
	programHandle := aCOMDispatchInstance.
	dataHandle := aDataHandle
]

{ #category : #accessing }
JinAccessProject >> macros [
	^ JinCollection new
		handle: (programHandle propertyNamed: #AllMacros)
		factory:
			((JinInstanceFactory defaultFor: JinMacro)
				project: self;
				yourself)
]

{ #category : #accessing }
JinAccessProject >> modules [
	^ JinCollection new
		handle: (programHandle propertyNamed: #AllModules)
		factory:
			((JinInstanceFactory defaultFor: JinModule)
				project: self;
				yourself)
]

{ #category : #'open-load-objects' }
JinAccessProject >> openForm: aJinForm [
	^ application openForm: aJinForm
]

{ #category : #'open-load-objects' }
JinAccessProject >> openModule: aJinModule [
	^ application openModule: aJinModule
]

{ #category : #accessing }
JinAccessProject >> queries [
	^ JinCollection new
		handle: (dataHandle propertyNamed: #AllQueries)
		factory:
			((JinInstanceFactory defaultFor: JinQuery)
				project: self;
				yourself)
]

{ #category : #accessing }
JinAccessProject >> reports [
	^ JinCollection new
		handle: (programHandle propertyNamed: #AllReports)
		factory:
			((JinInstanceFactory defaultFor: JinReport)
				project: self;
				yourself)
]

{ #category : #accessing }
JinAccessProject >> tables [
	^ JinCollection new
		handle: (dataHandle propertyNamed: #AllTables)
		factory:
			((JinInstanceFactory defaultFor: JinTable)
				project: self;
				yourself)
]
