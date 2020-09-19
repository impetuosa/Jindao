Class {
	#name : #JinCasinoToAngularModel,
	#superclass : #Object,
	#instVars : [
		'destination',
		'origin',
		'createdEntitites',
		'stack',
		'factory',
		'behaviorWriter'
	],
	#category : #JindaoMoose
}

{ #category : #private }
JinCasinoToAngularModel class >> loadFrom: aJinCasinoPartialModelCreator [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinCasinoToAngularModel class >> loadFrom: aJinCasinoPartialModelCreator into: aJinAngularModule [ 
	| visitor | 
	visitor := self new.
	visitor destination: aJinAngularModule.
	visitor origin: aJinCasinoPartialModelCreator. 
	^ visitor calculateAngularModel. 
]

{ #category : #'as yet unclassified' }
JinCasinoToAngularModel >> calculateAngularModel [

	createdEntitites := Set new.
	origin model accept: self.
	destination components addAll: createdEntitites.
	createdEntitites do: [ : c | c module: destination  ]
]

{ #category : #'as yet unclassified' }
JinCasinoToAngularModel >> createdEntities [
	^ createdEntitites 
]

{ #category : #accessing }
JinCasinoToAngularModel >> destination: aJinAngularModule [ 
	destination := aJinAngularModule
]

{ #category : #accessing }
JinCasinoToAngularModel >> factory [
	^ factory ifNil: [ factory := JinAngularModelStatelessFactory new ]
]

{ #category : #accessing }
JinCasinoToAngularModel >> origin: aJinCasinoPartialModelCreator [ 
	origin := aJinCasinoPartialModelCreator
]

{ #category : #visiting }
JinCasinoToAngularModel >> visitCSNPage: aJinCasinoPage [ 
	| component templateWriter |
	component := self factory createNewAngularComponent.
	component name: aJinCasinoPage name.
	createdEntitites add: component. 
	templateWriter := self factory createNewAngularComponentTemplateWriter.  
	templateWriter writeHtmlFor: aJinCasinoPage into: component.  
	
	behaviorWriter := self factory createNewAngularComponentBehaviorWriter. 
	behaviorWriter writeBehaviorFor: aJinCasinoPage into: component. 
	
	
]

{ #category : #visiting }
JinCasinoToAngularModel >> visitMooseModel: aCSNUICWModel [

	origin firstClassCitizenMooseModels do: [ :fc | fc accept: self ].
 
]
