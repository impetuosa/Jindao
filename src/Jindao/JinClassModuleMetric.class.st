Class {
	#name : #JinClassModuleMetric,
	#superclass : #JinSourcedEntity,
	#category : #'Jindao-Metrics'
}

{ #category : #properties }
JinClassModuleMetric >> LOC [
	^ properties at:#LOC ifAbsent: nil 
]

{ #category : #properties }
JinClassModuleMetric >> kind [
	^ 'ClassModule'
]

{ #category : #'as yet unclassified' }
JinClassModuleMetric >> loc [
	<cvs: #'LOC' at: 2>
	^ self LOC
]

{ #category : #properties }
JinClassModuleMetric >> name [
	<cvs: #name at: 1>
	^ properties at: #name ifAbsent: nil
]

{ #category : #properties }
JinClassModuleMetric >> printOn: aStream [
	aStream
		nextPutAll:
			('Class>> loc:{1} name:{2} deps: {3}'
				format:
					{self LOC.
					self name.
					self allDependencies size})
]
