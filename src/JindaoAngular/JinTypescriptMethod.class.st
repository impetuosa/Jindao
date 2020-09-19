Class {
	#name : #JinTypescriptMethod,
	#superclass : #JinTypescriptObject,
	#instVars : [
		'selector',
		'class',
		'parameters',
		'type'
	],
	#category : #JindaoAngular
}

{ #category : #visiting }
JinTypescriptMethod >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitTypescriptMethod: self 
]

{ #category : #adding }
JinTypescriptMethod >> addParameter: aJinVariable [ 
	parameters add: aJinVariable 
]

{ #category : #accessing }
JinTypescriptMethod >> initialize [

	super initialize.
	parameters := OrderedCollection new
]

{ #category : #accessing }
JinTypescriptMethod >> parameters [
	^ parameters
]

{ #category : #accessing }
JinTypescriptMethod >> selector [
	^ selector
]

{ #category : #accessing }
JinTypescriptMethod >> selector: aString [

	selector := aString.
	name := aString 
]

{ #category : #accessing }
JinTypescriptMethod >> setOwnerClass: aClassObject [ 
	class := aClassObject 
]

{ #category : #generated }
JinTypescriptMethod >> type: aJinTypescriptTypeReference [ 
	type := aJinTypescriptTypeReference 
]
