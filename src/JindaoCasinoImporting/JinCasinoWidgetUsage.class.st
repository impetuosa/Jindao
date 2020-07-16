Class {
	#name : #JinCasinoWidgetUsage,
	#superclass : #Object,
	#instVars : [
		'widgetName',
		'mooseModel'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #accessing }
JinCasinoWidgetUsage >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitJinCasinoWidgetUsage: self
]

{ #category : #accessing }
JinCasinoWidgetUsage >> mooseModel [
	^ mooseModel
]

{ #category : #accessing }
JinCasinoWidgetUsage >> mooseModel: anObject [
	mooseModel := anObject
]

{ #category : #accessing }
JinCasinoWidgetUsage >> widgetName [
	^ widgetName
]

{ #category : #accessing }
JinCasinoWidgetUsage >> widgetName: anObject [
	widgetName := anObject
]
