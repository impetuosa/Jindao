Class {
	#name : #JinAccidentalMooseModelCreator,
	#superclass : #Object,
	#instVars : [
		'model',
		'blApplication'
	],
	#category : #JindaoCasinoImporting
}

{ #category : #running }
JinAccidentalMooseModelCreator class >> runOn: aModel from: aBlApplication [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		basicRun;
		model
]

{ #category : #running }
JinAccidentalMooseModelCreator class >> runOn: aModel from: aBlApplication with: xml [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		xml: xml;
		basicRun;
		model
]

{ #category : #run }
JinAccidentalMooseModelCreator >> basicRun [
	self modelKind new createModelIn: model.
]

{ #category : #accessing }
JinAccidentalMooseModelCreator >> blApplication [
	^ blApplication
]

{ #category : #accessing }
JinAccidentalMooseModelCreator >> blApplication: anObject [
	blApplication := anObject
]

{ #category : #accessing }
JinAccidentalMooseModelCreator >> model [
	^ model
]

{ #category : #accessing }
JinAccidentalMooseModelCreator >> model: aModel [
	model := aModel
]

{ #category : #accessing }
JinAccidentalMooseModelCreator >> modelKind [
	self subclassResponsibility 
]
