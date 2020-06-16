Class {
	#name : #JinVBEProject,
	#superclass : #JinAccessObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinVBEProject >> components [
	^ JinCollection newDefaultForMethod
		handle: (handle propertyNamed: #VBComponents)
		factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinVBEComponent;
				yourself)
]

{ #category : #'as yet unclassified' }
JinVBEProject >> import: aFileReference [
	^ (handle propertyNamed: #VBComponents)
		dispatch: #Import
		withArguments: {aFileReference fullName}
]

{ #category : #'as yet unclassified' }
JinVBEProject >> sanitizedName [
	^ self name asLowercase
]
