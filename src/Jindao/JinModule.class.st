"
I am a module. I have the power of dealing with my content 
"
Class {
	#name : #JinModule,
	#superclass : #JinVBObject,
	#instVars : [
		'src'
	],
	#category : #'Jindao-MSAccess-Code'
}

{ #category : #accessing }
JinModule class >> typeNumber [
	^ 5
]

{ #category : #'as yet unclassified' }
JinModule >> acceptVisitor: aVisitor [
	aVisitor visitModule: self 
]

{ #category : #ast }
JinModule >> ast [
	^ self code ast 
]

{ #category : #'as yet unclassified' }
JinModule >> code [
	^ self body code
]

{ #category : #accessing }
JinModule >> color [
	^ Color yellow 
]

{ #category : #'as yet unclassified' }
JinModule >> contentHash [

	^ (MD5 hashMessage: self src) hex
]

{ #category : #'as yet unclassified' }
JinModule >> deleteLine: aNumber [
	^ self code deleteLine: aNumber
]

{ #category : #'as yet unclassified' }
JinModule >> export [
	^ self vbeComponent export
]

{ #category : #'as yet unclassified' }
JinModule >> insertLines: aString [
	^ self code insertLines: aString
]

{ #category : #'as yet unclassified' }
JinModule >> isClassModule [
	^ self vbeComponent properties
		anySatisfy: [ :p | p name = 'Instancing' ]
]

{ #category : #'as yet unclassified' }
JinModule >> isModule [

	^ true
]

{ #category : #'as yet unclassified' }
JinModule >> isReferredBySymbol: aJinNSNameEntry [

	^ (aJinNSNameEntry kind isClassModule or: [ 
		   aJinNSNameEntry kind isModule ]) and: [ 
		  aJinNSNameEntry referersTo: self name ]
]

{ #category : #accessing }
JinModule >> privateLoadBodyObject [
	^ (project openModule: self) 
]

{ #category : #'as yet unclassified' }
JinModule >> save [
	project save: self .
]

{ #category : #'as yet unclassified' }
JinModule >> sourceCode [

	^ self code contents
]

{ #category : #accessing }
JinModule >> src [

	^ src ifNil: [ 
		  src := self body code.
		  src = '' ifFalse: [ src := src contents ].
		  src ]
]

{ #category : #'as yet unclassified' }
JinModule >> type [
	^ self vbeComponent type
]

{ #category : #accessing }
JinModule >> vbeComponentName [
	^ self name
]
