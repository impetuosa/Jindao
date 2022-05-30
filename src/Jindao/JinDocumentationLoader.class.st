Class {
	#name : #JinDocumentationLoader,
	#superclass : #Object,
	#instVars : [
		'modules'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Jindao-COMDoc'
}

{ #category : #accessing }
JinDocumentationLoader class >> default [
	^ default
		ifNil: [ default := self new
				loadControlDetailsFrom: 'd:/Users/Santiago.BRAGAGNOLO/Documents/git-repositories/VBA-Docs/api' asFileReference ]
]

{ #category : #accessing }
JinDocumentationLoader >> access [
	^ modules at: #Access 
]

{ #category : #accessing }
JinDocumentationLoader >> initialize [ 
	modules := Dictionary new . 
]

{ #category : #accessing }
JinDocumentationLoader >> loadControlDetailsFrom: aAPIDirectory [

	aAPIDirectory entries select: [ : f | f name endsWith: 'md' ] thenDo: [ :f | 
			| parts |
			parts := ('.' split: f name) .
			(parts allButLast inject: self into: [ : acc : each | acc partNamed: each ]) fileReference: f asFileReference .
	]
]

{ #category : #accessing }
JinDocumentationLoader >> partNamed: aName [
	^ modules
		at: aName
		ifAbsentPut: [ JinComDocumentationModule new
				name: aName;
				yourself ]
]
