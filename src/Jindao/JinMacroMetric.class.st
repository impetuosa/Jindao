Class {
	#name : #JinMacroMetric,
	#superclass : #JinStructuralMetric,
	#category : #'Jindao-Metrics'
}

{ #category : #accessing }
JinMacroMetric >> name [
	<cvs: #name at: 1>
	
	^ properties at: #name ifAbsent: nil
]

{ #category : #accessing }
JinMacroMetric >> printOn: aStream [
	aStream
		nextPutAll: ' Macro >> name: ';
		nextPutAll: self name
]
