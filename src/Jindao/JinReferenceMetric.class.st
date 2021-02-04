Class {
	#name : #JinReferenceMetric,
	#superclass : #JinStructuralMetric,
	#category : #'Jindao-Metrics'
}

{ #category : #properties }
JinReferenceMetric >> builtIn [
	<cvs: #'Built In' at: 2>
	^ properties at:#BuiltIn ifAbsent: nil 
]

{ #category : #properties }
JinReferenceMetric >> major [
	^ properties at:#Major ifAbsent: nil 
]

{ #category : #properties }
JinReferenceMetric >> minor [
	^ properties at:#Minor ifAbsent: nil 
]

{ #category : #properties }
JinReferenceMetric >> path [
	<cvs: #path at: 1>
	^ (properties at:#Path ifAbsent: nil )
]

{ #category : #properties }
JinReferenceMetric >> printOn: aStream [
	aStream
		nextPutAll:
			('Ref>> builtIn:{1} path:{2}'
				format:
					{self builtIn asString.
					self path})
]
