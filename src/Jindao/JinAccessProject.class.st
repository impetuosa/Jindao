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
		'reports',
		'tables'
	],
	#category : #'Jindao-Core'
}

{ #category : #'initialize-release' }
JinAccessProject >> acceptVisitor: aVisitor [
	^ aVisitor visitProject: self 
]

{ #category : #accessing }
JinAccessProject >> application [
	^ application
]

{ #category : #'initialize-release' }
JinAccessProject >> close [
	application closeProject: self. 
]

{ #category : #'form-api' }
JinAccessProject >> forms [
	^ forms
		ifNil: [ forms := JinCollection newDefault
				handle: (programHandle propertyNamed: #AllForms)
				factory:
					((JinFirstClassCitizenModelFactory defaultFor: JinForm)
						project: self;
						yourself) ]
]

{ #category : #accessing }
JinAccessProject >> fullName [
	^ programHandle propertyNamed:#FullName
]

{ #category : #'initialize-release' }
JinAccessProject >> handle: aCOMDispatchInstance dataHandle: aDataHandle application: anApplication [
	application := anApplication .
	programHandle := aCOMDispatchInstance.
	dataHandle := aDataHandle
]

{ #category : #'macro-api' }
JinAccessProject >> macros [
	^ macros
		ifNil: [ macros := JinCollection newDefault
				handle: (programHandle propertyNamed: #AllMacros)
				factory:
					((JinFirstClassCitizenModelFactory defaultFor: JinMacro)
						project: self;
						yourself) ]
]

{ #category : #'module-api' }
JinAccessProject >> modules [
	^ modules
		ifNil: [ modules := JinCollection newDefault
				handle: (programHandle propertyNamed: #AllModules)
				factory:
					((JinFirstClassCitizenModelFactory defaultFor: JinModule)
						project: self;
						yourself) ]
]

{ #category : #accessing }
JinAccessProject >> name [
	^ programHandle propertyNamed: #Name 
]

{ #category : #'form-api' }
JinAccessProject >> newForm [
	^ application newForm 
]

{ #category : #'form-api' }
JinAccessProject >> openForm: aJinForm [
	^ application openForm: aJinForm
]

{ #category : #'module-api' }
JinAccessProject >> openModule: aJinModule [
	^ application openModule: aJinModule
]

{ #category : #'query-api' }
JinAccessProject >> openQuery: aJinQuery [
	^ application openQuery: aJinQuery
]

{ #category : #'report-api' }
JinAccessProject >> openReport: aJinReport [ 
	^ application openReport: aJinReport 
]

{ #category : #'table-api' }
JinAccessProject >> openTable: aJinTable [ 
	^ application openTable: aJinTable 
]

{ #category : #'query-api' }
JinAccessProject >> queries [
	^ queries
		ifNil: [ queries := JinCollection newDefault
				handle: (dataHandle propertyNamed: #AllQueries)
				factory:
					((JinFirstClassCitizenModelFactory defaultFor: JinQuery)
						project: self;
						yourself) ]
]

{ #category : #accessing }
JinAccessProject >> references [
	^ application references
]

{ #category : #'report-api' }
JinAccessProject >> reports [
	^ reports
		ifNil: [ reports := JinCollection newDefault
				handle: (programHandle propertyNamed: #AllReports)
				factory:
					((JinFirstClassCitizenModelFactory defaultFor: JinReport)
						project: self;
						yourself) ]
]

{ #category : #'table-api' }
JinAccessProject >> tables [
	^ tables
		ifNil: [ tables := JinCollection newDefault
				handle: (dataHandle propertyNamed: #AllTables)
				factory:
					((JinFirstClassCitizenModelFactory defaultFor: JinTable)
						project: self;
						yourself) ]
]
