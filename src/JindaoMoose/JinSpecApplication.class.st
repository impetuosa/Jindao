Class {
	#name : #JinSpecApplication,
	#superclass : #SpApplication,
	#classVars : [
		'Current'
	],
	#category : #JindaoMoose
}

{ #category : #'instance creation' }
JinSpecApplication class >> current [ 
	
	^ Current ifNil: [ Current := self new ]
]

{ #category : #'class initialization' }
JinSpecApplication class >> initialize [ 

	SessionManager default registerToolClassNamed: self name
]

{ #category : #'system startup' }
JinSpecApplication class >> shutDown: quitting [

	Current ifNil: [ ^ self ].
	Current shutDown: quitting
]

{ #category : #'system startup' }
JinSpecApplication class >> startUp: resuming [

	Current ifNil: [ ^ self ].
	Current startUp: resuming
]

{ #category : #initialization }
JinSpecApplication >> initialize [

	super initialize.
	self resetConfiguration
]

{ #category : #initialization }
JinSpecApplication >> resetConfiguration [
	
	self flag: #TODO. "Replace this with a proper initialization mechanism (which is not
	implemented at the moment, and we need to choose the backend from it)"
	self class environment 
		at: #StPharoMorphicConfiguration
		ifPresent: [ :aClass | self useBackend: #Morphic with: aClass new ]
]

{ #category : #running }
JinSpecApplication >> run [ 

	Current ifNotNil: [ Current close ].
	super run. 
	Current := self
]

{ #category : #'system startup' }
JinSpecApplication >> shutDown: quitting [
]

{ #category : #'private running' }
JinSpecApplication >> start [

	
]

{ #category : #'system startup' }
JinSpecApplication >> startUp: resuming [
]

{ #category : #settings }
JinSpecApplication >> toolbarDisplayMode [

	^ StPharoSettings toolbarDisplayMode
]
