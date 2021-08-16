Class {
	#name : #JinDAMAccessModule,
	#superclass : #JinDAMArtefact,
	#instVars : [
		'dependencies'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMAccessModule >> addDependency: aJinDAMLibrary [

	self dependencies add: aJinDAMLibrary
]

{ #category : #accessing }
JinDAMAccessModule >> dependencies [
	^ dependencies ifNil: [ dependencies := OrderedCollection new  ]
]

{ #category : #'as yet unclassified' }
JinDAMAccessModule >> relatedSymbolKind [

	^ JinNSKind assembly
]
