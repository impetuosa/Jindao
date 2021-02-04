Class {
	#name : #JinTableMetric,
	#superclass : #JinStructuralMetric,
	#category : #'Jindao-Metrics'
}

{ #category : #properties }
JinTableMetric >> fields [
	<cvs: #fields at: 2>
	^ properties at: #Fields ifAbsent: nil
]

{ #category : #properties }
JinTableMetric >> name [
	<cvs: #name at: 1>
	^ properties at: #name ifAbsent: nil
]

{ #category : #properties }
JinTableMetric >> printOn: aStream [
	aStream
		nextPutAll:
			('Table>> fields:{1} name:{2}'
				format:
					{self fields asString.
					self name})
]
