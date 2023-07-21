"
i am a factory that generates classes on demand. 
"
Class {
	#name : #JinRemoteObjectClassGeneratorFactory,
	#superclass : #JinRemoteObjectMappedClassFactory,
	#instVars : [
		'buildingClass',
		'packageName'
	],
	#category : #'Jindao-Core-Factories'
}

{ #category : #'instance creation' }
JinRemoteObjectClassGeneratorFactory class >> newAccessPropertyDoubleClassBasedFactory [
	^ self newDefaultAccessPropertyFactory: JinControlDoubleClassBuilder
]

{ #category : #'instance creation' }
JinRemoteObjectClassGeneratorFactory class >> newAccessPropertySimpleClassBasedFactory [
	^ self newDefaultAccessPropertyFactory: JinControlClassBuilder
]

{ #category : #'instance creation' }
JinRemoteObjectClassGeneratorFactory class >> newControlDoubleClassBasedFactory [
	^ self newDefaultControlsFactory: JinControlDoubleClassBuilder
]

{ #category : #'instance creation' }
JinRemoteObjectClassGeneratorFactory class >> newControlSimpleClassBasedFactory [
	^ self newDefaultControlsFactory: JinControlClassBuilder
]

{ #category : #'instance creation' }
JinRemoteObjectClassGeneratorFactory class >> newDefaultAccessPropertyFactory [
	^ self newAccessPropertyDoubleClassBasedFactory
]

{ #category : #'instance creation' }
JinRemoteObjectClassGeneratorFactory class >> newDefaultAccessPropertyFactory: aJinClassBuilder [
	
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
JinRemoteObjectClassGeneratorFactory class >> newDefaultControlsFactory [
	^ self newControlDoubleClassBasedFactory
]

{ #category : #'instance creation' }
JinRemoteObjectClassGeneratorFactory class >> newDefaultControlsFactory: aJinClassBuilder [
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
JinRemoteObjectClassGeneratorFactory >> buildingClass [
	^ buildingClass
]

{ #category : #accessing }
JinRemoteObjectClassGeneratorFactory >> buildingClass: aClass [
	buildingClass := aClass
]

{ #category : #accessing }
JinRemoteObjectClassGeneratorFactory >> classFor: aControl [
	<doc:
	'Returns a class to instantiate to represent a given remote handle. If none is found, it delegates to a builder to create a Pharo Class able to hold the given handle, and to be after visit separately.'>
	^ self
		classFor: aControl
		ifNone: [ self generateClassControlFor: aControl ]
]

{ #category : #accessing }
JinRemoteObjectClassGeneratorFactory >> generateClassControlFor: aRemoteObject [
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
JinRemoteObjectClassGeneratorFactory >> newBuilder [
	^ self buildingClass new
		packageName: packageName;
		superclass: self defaultHierarchyClass;
		yourself
]

{ #category : #accessing }
JinRemoteObjectClassGeneratorFactory >> newBuilderForName: aName [
	^ self newBuilder
		name: aName;
		yourself
]

{ #category : #accessing }
JinRemoteObjectClassGeneratorFactory >> packageName: aName [
	packageName := aName
]

{ #category : #accessing }
JinRemoteObjectClassGeneratorFactory >> selectMethodsFor: aRemoteObject [
	^ aRemoteObject getTypeInfo methods
]

{ #category : #accessing }
JinRemoteObjectClassGeneratorFactory >> selectPropertiesFor: aRemoteObject [
	^ aRemoteObject getTypeInfo properties
]
