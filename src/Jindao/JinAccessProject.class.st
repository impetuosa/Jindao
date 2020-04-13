Class {
	#name : #JinAccessProject,
	#superclass : #Object,
	#instVars : [
		'programHandle',
		'dataHandle',
		'application'
	],
	#category : #Jindao
}

{ #category : #'as yet unclassified' }
JinAccessProject >> close [
	application closeProject: self. 
]

{ #category : #'as yet unclassified' }
JinAccessProject >> forms [
	^ JinCollection new
		handle: (programHandle propertyNamed: #AllForms)
		factory: (JinInstanceFactory defaultFor: JinForm)
]

{ #category : #'as yet unclassified' }
JinAccessProject >> handle: aCOMDispatchInstance dataHandle: aDataHandle application: anApplication [
	application := anApplication .
	programHandle := aCOMDispatchInstance.
	dataHandle := aDataHandle
]

{ #category : #'as yet unclassified' }
JinAccessProject >> macros [
	^ JinCollection new handle: (programHandle propertyNamed: #AllMacros)
]

{ #category : #'as yet unclassified' }
JinAccessProject >> modules [
	^ JinCollection new handle: (programHandle propertyNamed: #AllModules)
]

{ #category : #'as yet unclassified' }
JinAccessProject >> queries [
	^ JinCollection new handle: (dataHandle  propertyNamed: #AllQueries)
]

{ #category : #'as yet unclassified' }
JinAccessProject >> reports [
	^ JinCollection new handle: (programHandle propertyNamed: #AllReports ).
	

]

{ #category : #'as yet unclassified' }
JinAccessProject >> tables [
	^ JinCollection new handle: (dataHandle propertyNamed: #AllTables)
]
