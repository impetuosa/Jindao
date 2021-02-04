Class {
	#name : #JinModuleMetric,
	#superclass : #JinSourcedEntity,
	#category : #'Jindao-Metrics'
}

{ #category : #properties }
JinModuleMetric >> LOC [
	^ properties at:#LOC ifAbsent: nil 
]

{ #category : #properties }
JinModuleMetric >> kind [
	^ 'Module'
]

{ #category : #'as yet unclassified' }
JinModuleMetric >> loc [
	<cvs: #LOC at: 2>
	^ self LOC
]

{ #category : #properties }
JinModuleMetric >> name [
<cvs: #name at: 1>
	^ properties at:#name ifAbsent: nil 
]

{ #category : #properties }
JinModuleMetric >> printOn: aStream [
	aStream
		nextPutAll:
			('Module>> loc:{1} name:{2} deps: {3}'
				format:
					{self LOC.
					self name.
					self allDependencies size})
]
