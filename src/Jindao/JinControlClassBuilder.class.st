Class {
	#name : #JinControlClassBuilder,
	#superclass : #Object,
	#instVars : [
		'superclass',
		'name'
	],
	#category : #'Jindao-Factories'
}

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> addProperty: aCOMProperty [
	aCOMProperty getter
		ifNotNil: [ self buildingClass
				compile: (self getterCodeFor: aCOMProperty)
				classified: 'property - generated' ].
	aCOMProperty setter
		ifNotNil: [ self buildingClass
				compile: (self setterCodeFor: aCOMProperty)
				classified: 'property - generated' ]
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> getterCodeFor: aCOMProperty [
	self assert: aCOMProperty getter parameterNames isEmpty.
	^ '{1}
	^ (handle propertyNamed: #''{2}'' ).
'
		format:
			{self methodNameFor: aCOMProperty name .
			aCOMProperty name}
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> methodNameFor: aString [
	^ aString first lowercase asString , aString allButFirst
]

{ #category : #'class name' }
JinControlClassBuilder >> name: aString [ 
	name := (superclass name , aString) copyReplaceAll: '_' with: ''
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> superclass: aClass [ 
	superclass := aClass
]
