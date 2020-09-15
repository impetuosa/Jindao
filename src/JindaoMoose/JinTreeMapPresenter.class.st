Class {
	#name : #JinTreeMapPresenter,
	#superclass : #JinPresenter,
	#instVars : [
		'treemap'
	],
	#category : #JindaoMoose
}

{ #category : #specs }
JinTreeMapPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		  add: #treemap;
		  yourself
]

{ #category : #initialization }
JinTreeMapPresenter >> initializePresenters [

	super initializePresenters.
	treemap := self instantiate: MiTreeMap. 
	treemap childrenBlock: [ :el | 
		((el usesFamixTrait: TEntityMetaLevelDependency) or: [ 
			 el respondsTo: #children ])
			ifTrue: [ el children ]
			ifFalse: [ {  } ] ]
]

{ #category : #initialization }
JinTreeMapPresenter >> model: aModel [

	treemap
		unHighlight;
		rootEntities: aModel rootsForTreeMap.
	treemap run
]
