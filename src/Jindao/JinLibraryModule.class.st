Class {
	#name : #JinLibraryModule,
	#superclass : #JinLibraryStructure,
	#instVars : [
		'staticVariables',
		'constants',
		'properties',
		'methods'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #'as yet unclassified' }
JinLibraryModule >> accept: aVisitor [
	^ aVisitor visitModule: self.

]

{ #category : #accessing }
JinLibraryModule >> constants [
	^ constants
]

{ #category : #accessing }
JinLibraryModule >> constants: aCollection [

	constants := aCollection.
	aCollection do: [ :m | m owner: self ]
]

{ #category : #accessing }
JinLibraryModule >> methods [
	^ methods
]

{ #category : #accessing }
JinLibraryModule >> methods: aCollection [

	methods := aCollection.
	aCollection do: [ :m | m owner: self ]
]

{ #category : #accessing }
JinLibraryModule >> printOn: aStream [

	aStream
		nextPutAll: self printingName;
		nextPut: $(;
		nextPutAll: name;
		nextPut: $)
]

{ #category : #accessing }
JinLibraryModule >> printingName [
	^ self class name copyReplaceAll: 'JinLibrary' with: ''
]

{ #category : #accessing }
JinLibraryModule >> properties: aCollection [

	properties := aCollection.
	aCollection do: [ :m | m owner: self ]
]

{ #category : #accessing }
JinLibraryModule >> staticVariables [
	^ staticVariables
]

{ #category : #accessing }
JinLibraryModule >> staticVariables: aCollection [

	staticVariables := aCollection.
	aCollection do: [ :m | m owner: self ]
]
