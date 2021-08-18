Class {
	#name : #JinDAMLibrary,
	#superclass : #JinDAMArtefact,
	#instVars : [
		'isBuiltIn',
		'invocables'
	],
	#category : #'JinDAM-Model'
}

{ #category : #adding }
JinDAMLibrary >> addInvocable: aJinDAMFunction [

	self invocables add: aJinDAMFunction
]

{ #category : #accessing }
JinDAMLibrary >> invocables [
	^ invocables ifNil: [ invocables := OrderedCollection new  ]
]

{ #category : #testing }
JinDAMLibrary >> isBuiltIn: aBoolean [

	isBuiltIn := aBoolean
]

{ #category : #testing }
JinDAMLibrary >> printOn: aStream [

	aStream nextPutAll: 'Lib ('.
	aStream
		nextPutAll: name;
		nextPut: $)
]

{ #category : #testing }
JinDAMLibrary >> relatedSymbolKind [

	^ #isAssembly
]
