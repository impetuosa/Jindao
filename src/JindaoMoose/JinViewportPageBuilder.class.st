Class {
	#name : #JinViewportPageBuilder,
	#superclass : #Object,
	#instVars : [
		'page',
		'owner'
	],
	#category : #JindaoMoose
}

{ #category : #'as yet unclassified' }
JinViewportPageBuilder >> buildPageFor: aJinAngularComponentBehaviour into: aSpNotebookPresenter [

	owner := aSpNotebookPresenter.
	aJinAngularComponentBehaviour acceptVisitor: self.
	page ifNotNil: [ 
		owner addPage: page.
		owner selectPage: page 
	]
]

{ #category : #visiting }
JinViewportPageBuilder >> newTextPageNamed: name withContent: content [
	| textPage | 
	textPage := owner newNotebookPage.
	textPage beCloseable .
	textPage title: name.
	textPage presenterProvider: [ owner newText text: content ].
	^ textPage
]

{ #category : #visiting }
JinViewportPageBuilder >> visitAccessMooseModel: aJinAccessMooseModel [ 

]

{ #category : #visiting }
JinViewportPageBuilder >> visitAngularComponent: aJinAngularComponent [

	
]

{ #category : #visiting }
JinViewportPageBuilder >> visitAngularComponentBehavior: aJinAngularComponentBehaviour [

	page := self
		        newTextPageNamed: aJinAngularComponentBehaviour name
		        withContent: aJinAngularComponentBehaviour sourceCode
]

{ #category : #visiting }
JinViewportPageBuilder >> visitAngularComponentTemplate: aJinAngularComponentTemplate [

	page := self
		        newTextPageNamed: aJinAngularComponentTemplate name
		        withContent: aJinAngularComponentTemplate sourceCode
]

{ #category : #visiting }
JinViewportPageBuilder >> visitAngularModule: aJinAngularModule [ 

]

{ #category : #visiting }
JinViewportPageBuilder >> visitAngularScheme: aJinAngularScheme [ 
	
]

{ #category : #visiting }
JinViewportPageBuilder >> visitCustomControl: aJinControlGeneric [ 

]

{ #category : #visiting }
JinViewportPageBuilder >> visitForm: aJinForm [

]

{ #category : #visiting }
JinViewportPageBuilder >> visitModule: aJinObject [


]

{ #category : #visiting }
JinViewportPageBuilder >> visitQuery: aJinObject [


]

{ #category : #visiting }
JinViewportPageBuilder >> visitReport: aJinForm [

]

{ #category : #visiting }
JinViewportPageBuilder >> visitTable: aJinObject [


]
