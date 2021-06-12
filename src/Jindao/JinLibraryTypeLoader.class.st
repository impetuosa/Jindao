Class {
	#name : #JinLibraryTypeLoader,
	#superclass : #Object,
	#instVars : [
		'library'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #loader }
JinLibraryTypeLoader >> library: aLibrary [

	library := aLibrary
]

{ #category : #loader }
JinLibraryTypeLoader >> load: aCOMTypeInfo [

	| type |
	type := self
		        perform: ('load'
			         ,
				         ((aCOMTypeInfo typeKind item
					           copyReplaceAll: 'TKIND_'
					           with: '') asLowercase capitalized , ':')) asSymbol
		        withArguments: { aCOMTypeInfo }.
	type owner: library.
	^ type
]

{ #category : #'as yet unclassified' }
JinLibraryTypeLoader >> loadAlias: aCOMTypeInfo [

	| coclass |
	coclass := JinLibraryAlias new
		           name: aCOMTypeInfo name;
		           aliaseeTypeName: aCOMTypeInfo aliasType typeName;
		           yourself.
	^ coclass
]

{ #category : #'as yet unclassified' }
JinLibraryTypeLoader >> loadCoclass: aCOMTypeInfo [ 

	| coclass |
	coclass := JinLibraryCoClass new
		            name: aCOMTypeInfo name;
		            yourself.
	^ coclass
]

{ #category : #'as yet unclassified' }
JinLibraryTypeLoader >> loadConstant: aCOMVar [

	^ JinLibraryConstant new
		  name: aCOMVar name;
		  value: aCOMVar value;
		  yourself
]

{ #category : #'as yet unclassified' }
JinLibraryTypeLoader >> loadDispatch: aCOMTypeInfo [
	
	| dispatch |
	dispatch := JinLibraryDispatchInterface new
		            name: aCOMTypeInfo name;
		            yourself.
	
	self loadTypeMembers: aCOMTypeInfo into: dispatch.
	^ dispatch
]

{ #category : #'as yet unclassified' }
JinLibraryTypeLoader >> loadEnum: aCOMTypeInfo [
	^ JinLibraryEnum new
		name: aCOMTypeInfo name;
		values: (aCOMTypeInfo vars collect: [ :v | 
					 JinLibraryEnumValue new
						 name: v name;
						 value: v value;
						 yourself ])
]

{ #category : #'load module' }
JinLibraryTypeLoader >> loadInstanceVariable: aVar [

	^ JinLibraryAttribute new
		  name: aVar name;
		  typeName: aVar typeName;
		  yourself
]

{ #category : #visiting }
JinLibraryTypeLoader >> loadInterface: aCOMTypeInfo [ 
	
	| interface |
	interface := JinLibraryInterface new
		            name: aCOMTypeInfo name;
		            yourself.

	self loadTypeMembers: aCOMTypeInfo into: interface.
	^ interface
]

{ #category : #'as yet unclassified' }
JinLibraryTypeLoader >> loadMethod: aCOMMethod [

	| m |
	aCOMMethod ifNil: [ ^ nil ].
	m := JinLibraryMethod new.
	m selector: aCOMMethod name.
	m parameters: (self loadMethodParameters: aCOMMethod).
	m returnTypeName: aCOMMethod returnType typeName.
	^ m
]

{ #category : #'as yet unclassified' }
JinLibraryTypeLoader >> loadMethodParameters: aCOMMethod [

	^ aCOMMethod parameterTypes
		  with: aCOMMethod parameterNames
		  collect: [ :paramType :paramName | 
			  JinLibraryParameter new
				  isOptional: (aCOMMethod optionalParameters includes: paramName);
				  name: paramName;
				  typeName: paramType typeName;
				  yourself ]
]

{ #category : #'load module' }
JinLibraryTypeLoader >> loadModule: aCOMTypeInfo [

	| module |
	module := JinLibraryModule new
		          name: aCOMTypeInfo name;
		          yourself.
	self loadTypeMembers: aCOMTypeInfo into: module.
	^ module
]

{ #category : #'as yet unclassified' }
JinLibraryTypeLoader >> loadProperty: aCOMProperty [

	| prop |
	prop := JinLibraryProperty new.
	prop name: aCOMProperty name.
	prop setter: (self loadMethod: aCOMProperty setter).
	prop getter: (self loadMethod: aCOMProperty getter).
	^ prop
]

{ #category : #'load module' }
JinLibraryTypeLoader >> loadRecord: aCOMTypeInfo [

	| record | 
	record := JinLibraryStructure new
		          name: aCOMTypeInfo name;
		          yourself.
	self loadStructureMembers: aCOMTypeInfo into: record. 
	^ record
]

{ #category : #'load module' }
JinLibraryTypeLoader >> loadStructureMembers: aCOMTypeInfo into: module [
	module instanceVariables:
		(aCOMTypeInfo instanceVariables collect: [ :in | 
			 self loadInstanceVariable: in ])
]

{ #category : #'load module' }
JinLibraryTypeLoader >> loadTypeMembers: aCOMTypeInfo into: module [

	self loadStructureMembers: aCOMTypeInfo into: module. 
	module staticVariables:
		(aCOMTypeInfo staticVariables collect: [ :i | 
			 self loadStaticVariable: i ]).
	module constants:
		(aCOMTypeInfo constants collect: [ :i | self loadConstant: i ]).
	module properties:
		(aCOMTypeInfo properties collect: [ :p | self loadProperty: p ]).
	module methods:
		(aCOMTypeInfo methods collect: [ :p | self loadMethod: p ])
]
