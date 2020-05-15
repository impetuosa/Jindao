Class {
	#name : #JinCasinoVisitor,
	#superclass : #JinBreathFirstVisitor,
	#instVars : [
		'stack',
		'importedProject',
		'mapper',
		'factory',
		'importingIntoThisModel'
	],
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> factory [
	^ factory ifNil: [ JinCasinoModelStatelessFactory new ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importAccessProperty: aProperty [
	^ [ self factory importAccessProperty: aProperty inTheContextOf: stack top ]
		on: Error
		do: [ :err | ^ nil ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importForm: aForm [
	^ self factory importForm: aForm inTheContextOf: stack top.
	
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importFormControl: aControl [
	^ [ self factory importControl: aControl inTheContextOf: stack top ]
		on: Error
		do: [ :err | ^ nil ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importProject: aProject [
	^ self factory importProject: aProject model: importingIntoThisModel . 
	
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> importedProject [
	^ importedProject
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> initialize [
	super initialize.
	stack := Stack new
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> pushInStack: anObject during: aBlock [
	stack push: anObject.
	aBlock value.
	^ stack pop
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> useModel: aModel [
	importingIntoThisModel := aModel
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitAccessProperty: aJinAccessProperty [
	^ self
		pushInStack: (self importAccessProperty: aJinAccessProperty)
		during: [ super visitAccessProperty: aJinAccessProperty ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitForm: aJinForm [
	^ self
		pushInStack: (self importForm: aJinForm)
		during: [ super visitForm: aJinForm ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitFormControl: aJinFormControl [
	^ self
		pushInStack: (self importFormControl: aJinFormControl)
		during: [ super visitFormControl: aJinFormControl ]
]

{ #category : #'as yet unclassified' }
JinCasinoVisitor >> visitProject: aJinAccessProject [
	^ importedProject := self
		pushInStack: (self importProject: aJinAccessProject)
		during: [ super visitProject: aJinAccessProject ]
]
