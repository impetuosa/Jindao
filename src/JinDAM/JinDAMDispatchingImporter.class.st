Class {
	#name : #JinDAMDispatchingImporter,
	#superclass : #JinSingleInstanceDispatchVisitor,
	#instVars : [
		'model',
		'filter',
		'sdkLibrary',
		'savingPhases',
		'references'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #'instance creation' }
JinDAMDispatchingImporter >> filter: aBlock [
	filter := aBlock
]

{ #category : #'instance creation' }
JinDAMDispatchingImporter >> initialize [

	super initialize.
	state := Stack new.
	filter := [ :a | true ].
	references := OrderedCollection new
]

{ #category : #'instance creation' }
JinDAMDispatchingImporter >> instantiate: aClass [

	^ model instantiate: aClass
]

{ #category : #accessing }
JinDAMDispatchingImporter >> model [
	^ model
]

{ #category : #'instance creation' }
JinDAMDispatchingImporter >> model: aModel [
	model := aModel
]

{ #category : #'instance creation' }
JinDAMDispatchingImporter >> references [

	^ references
]

{ #category : #'instance creation' }
JinDAMDispatchingImporter >> savingPhases [

	^ savingPhases ifNil: [ false ]
]

{ #category : #'instance creation' }
JinDAMDispatchingImporter >> savingPhases: aBool [ 
	savingPhases := aBool
]

{ #category : #'instance creation' }
JinDAMDispatchingImporter >> sdkLibrary [
	^ sdkLibrary ifNil: [  sdkLibrary := (JinDAMSDKLibraryBuilder forModel: model) build ]
]

{ #category : #'instance creation' }
JinDAMDispatchingImporter >> visitCollection: aCollection [
	| col |
	col := filter
		ifNil: [ :f | aCollection select: [ :e | filter value: e ] ]
		ifNotNil: [ aCollection ].
	^ super visitCollection: col
]
