Class {
	#name : #JinReportMetric,
	#superclass : #JinSourcedEntity,
	#category : #'Jindao-Metrics'
}

{ #category : #properties }
JinReportMetric >> amountCustomControls [
	<cvs: #'Custom Controls' at: 5>
	^ dependancies
		count: [ :d | 
			d isArray
				ifTrue: [ d first = 'CustomControl' ]
				ifFalse: [ d isKindOf: JinCustomControlType ] ]
]

{ #category : #properties }
JinReportMetric >> amountTables [
	<cvs: #'Tables Used' at: 6>
	^ dependancies
		count: [ :d | 
			d isArray
				ifTrue: [ d first = 'Table' ]
				ifFalse: [ d isKindOf: JinTableMetric ] ]
]

{ #category : #properties }
JinReportMetric >> companionModule [
	^ (children at: #ClassModule ifAbsent: [ {} ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :s | s first ]
]

{ #category : #properties }
JinReportMetric >> controls [
	<cvs: #Controls at: 3>
	^ properties at: #Controls ifAbsent: nil
]

{ #category : #properties }
JinReportMetric >> dropAstMetrics [
	sourceMetrics := nil.
	^ self companionModule ifNotNil: [ :mod | mod dropAstMetrics ]
]

{ #category : #properties }
JinReportMetric >> hasModule [
	^ properties at:#hasModule ifAbsent: nil 
]

{ #category : #properties }
JinReportMetric >> kind [
	^ 'Report'
]

{ #category : #properties }
JinReportMetric >> loc [
	<cvs: #LOC at: 2>
	^ self companionModule ifNil: [ 0 ] ifNotNil: [ :m | m LOC ]
]

{ #category : #properties }
JinReportMetric >> name [
	<cvs: #name at: 1>
	^ properties at: #name ifAbsent: nil
]

{ #category : #properties }
JinReportMetric >> printOn: aStream [
	aStream
		nextPutAll:
			('Report>> controls:{2} customs:{3} tables:{4} loc:{5} deps:{6} name:{1} '
				format:
					{self name.
					self controls.
					self amountCustomControls.
					self amountTables.
					self loc.
					self allDependencies size})
]

{ #category : #properties }
JinReportMetric >> properties [
	^ properties at:#properties ifAbsent: nil 
]

{ #category : #properties }
JinReportMetric >> source [
	^ self companionModule ifNotNil: [ :mod | mod source ]
]

{ #category : #properties }
JinReportMetric >> sourceMetrics [
	^ self companionModule
		ifNotNil: [ :mod | sourceMetrics := mod sourceMetrics ]
]

{ #category : #properties }
JinReportMetric >> type [
	<cvs: #Type at: 4>
	^ properties at: #type ifAbsent: nil
]
