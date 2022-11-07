"
Some components have three faces. I represent the VBEnvironment representation, where low level properties of a form or report are available 
"
Class {
	#name : #JinVBEComponent,
	#superclass : #JinAccessObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinVBEComponent >> export [
	handle
		dispatch: #Export
		withArguments: {self name asFileReference fullName}.
	^ self name asFileReference
]

{ #category : #'as yet unclassified' }
JinVBEComponent >> properties [
	^ JinCollection newDefaultForMethod
		handle: (handle propertyNamed: #Properties)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinAccessProperty;
				yourself)
]

{ #category : #'as yet unclassified' }
JinVBEComponent >> type [
	(handle propertyNamed: #Type) = 1
		ifTrue: [ ^ #Module ].
	(handle propertyNamed: #Type) = 2
		ifTrue: [ ^ #ClassModule ].
	(handle propertyNamed: #Type) = 100
		ifTrue: [ ^ #Form ].
	^ self error: 'Unkown type.'
]
