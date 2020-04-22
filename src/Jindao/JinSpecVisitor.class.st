Class {
	#name : #JinSpecVisitor,
	#superclass : #JinBreathFirstVisitor,
	#instVars : [
		'stack'
	],
	#category : #'Jindao-DomainObjects-Visitor'
}

{ #category : #'as yet unclassified' }
JinSpecVisitor >> createNewForm: aName [
	^ JinSpecForm new
		name: aName;
		project: stack top;
		yourself
]

{ #category : #'as yet unclassified' }
JinSpecVisitor >> createNewFormControl: aControl [
	| widget |
	widget := self instantiateWidgetFor: aControl.
	widget ifNil: [ ^ self ].
	stack top addControl: widget named: aControl name.
	^ widget
]

{ #category : #'as yet unclassified' }
JinSpecVisitor >> createNewProjectNamed: aName [
	^ JinSpecProject new
		name: aName;
		yourself
]

{ #category : #'as yet unclassified' }
JinSpecVisitor >> initialize [
	super initialize.
	stack := Stack new
]

{ #category : #'as yet unclassified' }
JinSpecVisitor >> instantiateWidgetFor: aControl [
	^ (self mappedClass: aControl class )
		ifNotNil: [ :widget | stack top instantiate: widget ]
]

{ #category : #'as yet unclassified' }
JinSpecVisitor >> mappedClass: aClass [
	aClass = JinControlTextbox
		ifTrue: [ ^ SpTextInputFieldPresenter ].
	aClass = JinControlLabel
		ifTrue: [ ^ SpLabelPresenter ].
	aClass = JinControlCombobox
		ifTrue: [ ^ SpDropListPresenter ].
	aClass = JinControlListBox
		ifTrue: [ ^ SpListPresenter ].
	aClass = JinControl
		ifTrue: [ ^ SpListPresenter ].
	^ nil
]

{ #category : #'as yet unclassified' }
JinSpecVisitor >> pushInStack: anObject during: aBlock [
	stack push: anObject.
	aBlock value.
	^ stack pop
]

{ #category : #'as yet unclassified' }
JinSpecVisitor >> visitForm: aJinForm [
	^ self
		pushInStack: (self createNewForm: aJinForm name)
		during: [ super visitForm: aJinForm ]
]

{ #category : #'as yet unclassified' }
JinSpecVisitor >> visitFormControl: aJinFormControl [
	^ self
		pushInStack: (self createNewFormControl: aJinFormControl)
		during: [ super visitFormControl: aJinFormControl ]
]

{ #category : #'as yet unclassified' }
JinSpecVisitor >> visitProject: aJinAccessProject [
	^ self
		pushInStack: (self createNewProjectNamed: aJinAccessProject name)
		during: [ super visitProject: aJinAccessProject. ]
]
