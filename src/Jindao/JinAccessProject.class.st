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
		'application',
		'forms',
		'macros',
		'modules',
		'queries',
		'reports'
	],
	#category : #'Jindao-DomainObjects'
}

{ #category : #'initialize-release' }
JinAccessProject >> acceptVisitor: aVisitor [
	^ aVisitor visitProject: self 
]

{ #category : #'initialize-release' }
JinAccessProject >> close [
	application closeProject: self. 
]

{ #category : #accessing }
JinAccessProject >> forms [
	^ forms
		ifNil: [ forms := JinCollection newDefault
				handle: (programHandle propertyNamed: #AllForms)
				factory:
					((JinInstanceFactory defaultFor: JinForm)
						project: self;
						yourself) ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> fullName [
	^ programHandle propertyNamed:#FullName
]

{ #category : #'initialize-release' }
JinAccessProject >> handle: aCOMDispatchInstance dataHandle: aDataHandle application: anApplication [
	application := anApplication .
	programHandle := aCOMDispatchInstance.
	dataHandle := aDataHandle
]

{ #category : #accessing }
JinAccessProject >> macros [
	^ macros
		ifNil: [ macros := JinCollection newDefault
				handle: (programHandle propertyNamed: #AllMacros)
				factory:
					((JinInstanceFactory defaultFor: JinMacro)
						project: self;
						yourself) ]
]

{ #category : #accessing }
JinAccessProject >> modules [
	^ modules
		ifNil: [ modules := JinCollection newDefault
				handle: (programHandle propertyNamed: #AllModules)
				factory:
					((JinInstanceFactory defaultFor: JinModule)
						project: self;
						yourself) ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> name [
	^ programHandle propertyNamed: #Name 
]

{ #category : #'open-load-objects' }
JinAccessProject >> openForm: aJinForm [
	^ application openForm: aJinForm
]

{ #category : #'open-load-objects' }
JinAccessProject >> openModule: aJinModule [
	^ application openModule: aJinModule
]

{ #category : #'as yet unclassified' }
JinAccessProject >> openQuery: aJinQuery [
	^ application openQuery: aJinQuery
]

{ #category : #'as yet unclassified' }
JinAccessProject >> openReport: aJinReport [ 
	^ application openReport: aJinReport 
]

{ #category : #accessing }
JinAccessProject >> queries [
	^ queries
		ifNil: [ queries := JinCollection newDefault
				handle: (dataHandle propertyNamed: #AllQueries)
				factory:
					((JinInstanceFactory defaultFor: JinQuery)
						project: self;
						yourself) ]
]

{ #category : #'as yet unclassified' }
JinAccessProject >> references [
	^ application references
]

{ #category : #accessing }
JinAccessProject >> reports [
	^ reports
		ifNil: [ reports := JinCollection newDefault
				handle: (programHandle propertyNamed: #AllReports)
				factory:
					((JinInstanceFactory defaultFor: JinReport)
						project: self;
						yourself) ]
]

{ #category : #accessing }
JinAccessProject >> tables [
	^ JinCollection newDefault
		handle: (dataHandle propertyNamed: #AllTables)
		factory:
			((JinInstanceFactory defaultFor: JinTable)
				project: self;
				yourself)
]
