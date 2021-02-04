Class {
	#name : #JinQueryMetric,
	#superclass : #JinStructuralMetric,
	#category : #'Jindao-Metrics'
}

{ #category : #properties }
JinQueryMetric >> fields [
	<cvs: #fields at: 2>
	^ properties at: #Fields ifAbsent: nil
]

{ #category : #properties }
JinQueryMetric >> name [
	<cvs: #name at: 1>
	^ properties at: #name ifAbsent: nil
]

{ #category : #properties }
JinQueryMetric >> printOn: aStream [
	aStream
		nextPutAll:
			('Query>> fields:{1} name:{2}'
				format:
					{self fields asString.
					self name})
]
