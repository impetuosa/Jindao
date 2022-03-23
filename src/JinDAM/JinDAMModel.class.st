Class {
	#name : #JinDAMModel,
	#superclass : #Object,
	#instVars : [
		'entities',
		'language',
		'anchor'
	],
	#classInstVars : [
		'northwind'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMModel class >> northwind [
	^ northwind
]

{ #category : #visiting }
JinDAMModel >> accept: anAlceJinDAMLoader [

	^ anAlceJinDAMLoader visitModel: self
]

{ #category : #visiting }
JinDAMModel >> acceptVisitor: aMOJinDAMModelReader [

	^ aMOJinDAMModelReader visitModel: self
]

{ #category : #'as yet unclassified' }
JinDAMModel >> accessModulesAndLibraries [

	^ entities select: [ :a | a isArtefact ]
]

{ #category : #'as yet unclassified' }
JinDAMModel >> allButReferences [

	^ entities reject: [ :e | e isKindOf: JinDAMReference ]
]

{ #category : #accessing }
JinDAMModel >> anchor [

	^ anchor ifNil: [ anchor := JinAnchor on: #/ ]
]

{ #category : #'as yet unclassified' }
JinDAMModel >> derivative [

	^ MOModelDerivative new
		  model: self;
		  yourself
]

{ #category : #accessing }
JinDAMModel >> entities [
	^ entities
]

{ #category : #testing }
JinDAMModel >> includes: anEntity [

	^ entities includes: anEntity
]

{ #category : #'instance creation' }
JinDAMModel >> initialize [

	super initialize.
	entities := OrderedCollection new . 
]

{ #category : #'instance creation' }
JinDAMModel >> instantiate: aClass [

	| obj |
	obj := aClass new.
	entities add: obj.
	^ obj
]

{ #category : #testing }
JinDAMModel >> isTypeReference [
	^ false
]

{ #category : #accessing }
JinDAMModel >> language [

	^ language ifNil: [ 
		  language := MOLanguage microsoftAccessForAlceModel: self ]
]

{ #category : #accessing }
JinDAMModel >> name [

	^ #jindam
]

{ #category : #accessing }
JinDAMModel >> references [
	^ entities select: [ :e | e isKindOf: JinDAMReference  ]
]
