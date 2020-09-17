Class {
	#name : #JinAngularFamixMetamodelGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'project',
		'module',
		'component',
		'template',
		'service',
		'class',
		'method',
		'attribute',
		'inheritance',
		'type',
		'parameter',
		'routing',
		'route',
		'injector',
		'injectable',
		'binding',
		'propertyBinding',
		'twoWayBinding',
		'eventBinding',
		'annotation'
	],
	#classInstVars : [
		'builder',
		'sourceAnchor'
	],
	#category : #JindaoAngular
}

{ #category : #accessing }
JinAngularFamixMetamodelGenerator class >> packageName [ 
	^ 'JindaoAngular'
]

{ #category : #accessing }
JinAngularFamixMetamodelGenerator class >> prefix [ 
	^ 'JinAngular'
]

{ #category : #definition }
JinAngularFamixMetamodelGenerator >> defineClasses [ 
	super defineClasses.
	
	" 
		Base Objects 	
	"
	project := builder newClassNamed: #Project.
	module := builder newClassNamed: #Module.
	component := builder newClassNamed: #Component.
	template := 	builder newClassNamed: #Template.
	service := 	builder newClassNamed: #Service.
	
	" 
		Class 
	"	
	class := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
	attribute := builder newClassNamed: #Attribute.
	inheritance := builder newClassNamed: #Inheritance.
	type := builder newClassNamed: #Type.
	parameter := builder newClassNamed: #Parameter .
	annotation := builder newClassNamed: #Annotation .
	
	
	"	
		Routing / Navigation 
	"
	routing := 	builder newClassNamed: #Routing.
	route := 		builder newClassNamed: #Route.
	
	
	" 
		Injection 
	"		
	injector := builder newClassNamed: #Injector.
	injectable := builder newClassNamed: #Injectable.
	
	
	" 
		Binding
	"
	binding := 	builder newClassNamed: #Binding.
	propertyBinding := 	builder newClassNamed: #PropertyBinding.
	twoWayBinding := builder newClassNamed: #TwoWaysBinding.
	eventBinding := 	builder newClassNamed: #EventBinding.
	
	
]

{ #category : #definition }
JinAngularFamixMetamodelGenerator >> defineHierarchy [

	super defineHierarchy.

	" 
		Base Objects 	
	"


	namedEntity --|> #TPackageable.


	"	
		Routing / Navigation 
	"
	routing --|> namedEntity.
	route --|> namedEntity.
	" 
		Injection 
	"
	injector --|> namedEntity.
	injectable --|> namedEntity.
	inheritance --|> namedEntity.
	project --|> namedEntity.
	attribute --|> namedEntity.
	attribute --|> #TTypedEntity.



	module --|> namedEntity.
	module --|> #TPackage.
	module --|> #TWithClasses.


	type --|> namedEntity.
	type --|> #TType.
	type --|> #TWithMethods.


	component --|> namedEntity.
	template --|> namedEntity.
	service --|> namedEntity.

	class
		--|> #TClass;
		--|> type.

	method
		--|> namedEntity;
		--|> #TMethod.

	parameter --|> namedEntity.
	parameter --|> #TParameter.

	annotation --|> namedEntity.
	routing --|> namedEntity.

	injectable --|> namedEntity.
	injectable --|> #TTypedEntity.

	binding --|> namedEntity.
	propertyBinding --|> binding.
	twoWayBinding --|> binding.
	eventBinding --|> binding
]

{ #category : #definition }
JinAngularFamixMetamodelGenerator >> defineProperties [
	super defineProperties.
	
]

{ #category : #definition }
JinAngularFamixMetamodelGenerator >> noww [
	<script:'self generate'>
]
