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
JinDAMModel class >> egrc: aJinDAMModel [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
JinDAMModel class >> northwind [
	^ northwind
]

{ #category : #accessing }
JinDAMModel class >> northwind: aJinDAMModel [ 
	northwind := aJinDAMModel
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
JinDAMModel >> accessLibraries [

	^ entities select: [ :a | a isLibrary ]
]

{ #category : #'as yet unclassified' }
JinDAMModel >> accessModules [

	^ entities select: [ :a | a isAccessModule ]
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
JinDAMModel >> candidateAnchors [

	^ (self references collect: #candidateAnchor thenReject: #isNil)
		  asSet
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

{ #category : #accessing }
JinDAMModel >> invocations [
	self shouldBeImplemented.
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

{ #category : #'as yet unclassified' }
JinDAMModel >> tableRelations [

	^ entities select: [ :a | a isKindOf: JinDAMTableRelation ]
]

{ #category : #'as yet unclassified' }
JinDAMModel >> userTypes [

	^ entities select: [ :e | e isUserDefinedType ]
]
