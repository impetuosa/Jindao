Class {
	#name : #JinAngularScheme,
	#superclass : #JinAngularContainer,
	#instVars : [
		'projects'
	],
	#category : #JindaoAngular
}

{ #category : #'as yet unclassified' }
JinAngularScheme class >> onPath:  aFileReference [
 	 ^ self new path: aFileReference; yourself 
]

{ #category : #visiting }
JinAngularScheme >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularScheme: self 
]

{ #category : #'close and quit' }
JinAngularScheme >> closeAndQuit [
	" nothign to do yer "
]

{ #category : #'as yet unclassified' }
JinAngularScheme >> defaultProject [

	^ self projects detect: [ :p | 
		  p name =( self metadata at: #defaultProject )]
]

{ #category : #accessing }
JinAngularScheme >> metadata [

	metadata ifNotNil: [ ^ metadata ].

	(path / 'angular.json') exists ifFalse: [ 
		self error:
			' the path does not point to a valid angular project installation ' ].

	metadata := STONJSON fromStream: (path / 'angular.json') readStream.
	^ metadata
]

{ #category : #accessing }
JinAngularScheme >> privateGetEntities [

	^ JinFileCollection new on: self sourceFolder
]

{ #category : #accessing }
JinAngularScheme >> projects [

	^ projects ifNil: [ 
		  projects :=( (self metadata at: #projects) associations collect: [  
			              :a | 
			              | instance projectMetadata |
								projectMetadata := a value. 
			              instance := JinAngularProject new.
							  instance name: a key. 
			              instance projectType:
				              (projectMetadata at: #projectType) asSymbol.
			              instance anchoredToUrlSegment:
				              (projectMetadata at: #root) asSymbol.
			              instance path:
				              path / (projectMetadata at: #sourceRoot).
				instance
						 ] )  ]
]
