"
I represent a regular module. 
I have some code defined in my self .
"
Class {
	#name : #JinModuleBody,
	#superclass : #JinBodyObject,
	#instVars : [
		'code'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinModuleBody >> code [
	^ code
		ifNil: [ code := JinSourceCode new
				handle: handle;
				yourself ]
]
