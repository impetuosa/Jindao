Class {
	#name : #JinRemoteObjectGeneratorFactory,
	#superclass : #JinRemoteObjectMappedTypesFactory,
	#instVars : [
		'buildingClass',
		'packageName'
	],
	#category : #'Jindao-Factories'
}

{ #category : #'instance creation' }
JinRemoteObjectGeneratorFactory class >> newAccessPropertyDoubleClassBasedFactory [
	^ self newDefaultAccessPropertyFactory: JinControlDoubleClassBuilder
]

{ #category : #'instance creation' }
JinRemoteObjectGeneratorFactory class >> newAccessPropertySimpleClassBasedFactory [
	^ self newDefaultAccessPropertyFactory: JinControlClassBuilder
]

{ #category : #'instance creation' }
JinRemoteObjectGeneratorFactory class >> newControlDoubleClassBasedFactory [
	^ self newDefaultControlsFactory: JinControlDoubleClassBuilder
]

{ #category : #'instance creation' }
JinRemoteObjectGeneratorFactory class >> newControlSimpleClassBasedFactory [
	^ self newDefaultControlsFactory: JinControlClassBuilder
]

{ #category : #'instance creation' }
JinRemoteObjectGeneratorFactory class >> newDefaultAccessPropertyFactory [
	^ self newAccessPropertyDoubleClassBasedFactory
]

{ #category : #'instance creation' }
JinRemoteObjectGeneratorFactory class >> newDefaultAccessPropertyFactory: aJinClassBuilder [
	^ self new
		defaultHierarchyClass: JinAccessPropertyGenerated;
		" If class not found, a new class will be created under this superclass "
			buildingClass: aJinClassBuilder;
		" If class not found, a new class will be created using this class buider. "
			nameResolver: [ :d | d propertyNamed: #Name ];
		" When a class has to be created, it is going to use this block as configuration. The property classes get their name from property individual name "
			packageName: 'Jindao-DomainObjects-GeneratedProperties';
			" Package where the generated classes are going to be "
		yourself
]

{ #category : #'instance creation' }
JinRemoteObjectGeneratorFactory class >> newDefaultControlsFactory [
	^ self newControlDoubleClassBasedFactory
]

{ #category : #'instance creation' }
JinRemoteObjectGeneratorFactory class >> newDefaultControlsFactory: aJinClassBuilder [
	^ self new
		defaultHierarchyClass: JinControlGenerated;
		" If class not found, a new class will be created under this superclass "
		buildingClass: aJinClassBuilder;
		" If class not found, a new class will be created using this class buider. "
		nameResolver: [ :d | d getTypeInfo name ];
			" When a class has to be created, it is going to use this block as configuration. The control classes get their name from the access type"
		packageName: 'Jindao-DomainObjects-GeneratedControls';
			" Package where the generated classes are going to be "
		yourself
]

{ #category : #accessing }
JinRemoteObjectGeneratorFactory >> buildingClass [
	^ buildingClass
]

{ #category : #accessing }
JinRemoteObjectGeneratorFactory >> buildingClass: aClass [
	buildingClass := aClass
]

{ #category : #accessing }
JinRemoteObjectGeneratorFactory >> classFor: aControl [
	^ self
		classFor: aControl
		ifNone: [ self generateClassControlFor: aControl ]
]

{ #category : #accessing }
JinRemoteObjectGeneratorFactory >> generateClassControlFor: aRemoteObject [
	| builder |
	builder := self newBuilderForName: (self resolveNameForClassGeneration: aRemoteObject).
	(self selectPropertiesFor: aRemoteObject)
		do: [ :p | builder addProperty: p ].
	(self selectMethodsFor: aRemoteObject)
		reject: [ :p | p isProperty ]
		thenDo: [ :p | builder addMethod: p ].
	^ builder build
]

{ #category : #accessing }
JinRemoteObjectGeneratorFactory >> newBuilder [
	^ self buildingClass new
		packageName: packageName;
		superclass: self defaultHierarchyClass;
		yourself
]

{ #category : #accessing }
JinRemoteObjectGeneratorFactory >> newBuilderForName: aName [
	^ self newBuilder
		name: aName;
		yourself
]

{ #category : #accessing }
JinRemoteObjectGeneratorFactory >> packageName: aName [
	packageName := aName
]

{ #category : #accessing }
JinRemoteObjectGeneratorFactory >> selectMethodsFor: aRemoteObject [
	^ aRemoteObject getTypeInfo methods
]

{ #category : #accessing }
JinRemoteObjectGeneratorFactory >> selectPropertiesFor: aRemoteObject [
	^ aRemoteObject getTypeInfo properties
]
