Class {
	#name : #JinFormMetric,
	#superclass : #JinSourcedEntity,
	#category : #'Jindao-Metrics'
}

{ #category : #properties }
JinFormMetric >> amountCustomControls [
	<cvs: #'Custom Controls' at: 5>
	^ dependancies
		count: [ :d | 
			d isArray
				ifTrue: [ d first = 'CustomControl' ]
				ifFalse: [ d isKindOf: JinCustomControlType ] ]
]

{ #category : #properties }
JinFormMetric >> amountTables [
	<cvs: #'Tables Used' at: 6>
	^ dependancies
		count: [ :d | 
			d isArray
				ifTrue: [ d first = 'Table' ]
				ifFalse: [ d isKindOf: JinTableMetric ] ]
]

{ #category : #'as yet unclassified' }
JinFormMetric >> companionModule [
	^ (children at: #ClassModule ifAbsent: [ {} ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :s | s first ]
]

{ #category : #properties }
JinFormMetric >> controls [
	<cvs: #'Controls' at: 3>
	^ properties at:#Controls ifAbsent: nil 
]

{ #category : #properties }
JinFormMetric >> dropAstMetrics [
	sourceMetrics := nil.
	^ self companionModule ifNotNil: [ :mod | mod dropAstMetrics ]
]

{ #category : #properties }
JinFormMetric >> hasModule [
	^ properties at:#hasModule ifAbsent: nil 
]

{ #category : #properties }
JinFormMetric >> kind [
	^ 'Form'
]

{ #category : #properties }
JinFormMetric >> loc [
	<cvs: #LOC at: 2>
	^ self companionModule ifNil: [ 0 ] ifNotNil: [ :m | m LOC ]
]

{ #category : #properties }
JinFormMetric >> name [
	<cvs: #name at: 1>
	^ properties at:#name ifAbsent: nil 
]

{ #category : #properties }
JinFormMetric >> printOn: aStream [
	aStream
		nextPutAll:
			('Form>> controls:{2} customs:{3} tables:{4} loc:{5} deps:{6} name:{1} '
				format:
					{self name.
					self controls.
					self amountCustomControls.
					self amountTables.
					self loc.
					self allDependencies size})
]

{ #category : #properties }
JinFormMetric >> properties [
	^ properties at:#properties ifAbsent: nil 
]

{ #category : #properties }
JinFormMetric >> source [
	^ self companionModule ifNotNil: [ :mod | mod source ]
]

{ #category : #properties }
JinFormMetric >> sourceMetrics [
	^ self companionModule
		ifNotNil: [ :mod | sourceMetrics := mod sourceMetrics ]
]

{ #category : #properties }
JinFormMetric >> type [
	<cvs: #'Type' at: 4>
	^ properties at:#type ifAbsent: nil 
]
