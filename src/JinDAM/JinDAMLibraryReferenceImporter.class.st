Class {
	#name : #JinDAMLibraryReferenceImporter,
	#superclass : #JinLibraryReferenceVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#category : #'JinDAM-Importers'
}

{ #category : #anchor }
JinDAMLibraryReferenceImporter >> dllAnchor: aString for: aJinLibraryConstant [

	^ self state top anchor / aString
]

{ #category : #'visiting accessor' }
JinDAMLibraryReferenceImporter >> instantiateGetterAccessorMethod: aJinLibraryMethod into: anAttribute [

	| acc selector |
	selector := ('_' split: aJinLibraryMethod selector) last.
	acc := self instantiate: JinDAMAttributeAccessor.
	acc kind: #Get.


	acc selector: selector.
	acc typeName: (self typeName: aJinLibraryMethod).

	self state top addInvocable: acc.
	self state push: acc.
	super visitLibraryMethod: aJinLibraryMethod.
	self state pop.
	anAttribute addAttributeAccessor: acc
]

{ #category : #'instantiate accessors' }
JinDAMLibraryReferenceImporter >> instantiateSetterAccessorMethod: aJinLibraryMethod into: anAttribute [

	| acc selector |
	selector := ('_' split: aJinLibraryMethod selector) last.
	acc := self instantiate: JinDAMAttributeAccessor.
	acc kind: #Set.


	acc selector: selector.
	acc typeName: (self typeName: aJinLibraryMethod).

	self state top addInvocable: acc.
	self state push: acc.
	super visitLibraryMethod: aJinLibraryMethod.
	self state pop.
	anAttribute addAttributeAccessor: acc
]

{ #category : #'as yet unclassified' }
JinDAMLibraryReferenceImporter >> nodeToTypeReferenceName: aVBNode context: aContext [ 
	^ self referenceNameConverter toTypeReferenceName: aVBNode context: aContext 
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibrary: aJinLibrary [

	self visitCollection: aJinLibrary types .
	self visitCollection: aJinLibrary functions.

	
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryAlias: aJinLibraryAlias [

	| obj |
	obj := self instantiate: JinDAMAlias.
	self state top addType: obj.
	obj name: aJinLibraryAlias name.
	obj anchor: self state top anchor / #alias / aJinLibraryAlias name.
	obj typeName:
		(self typeNameReference: aJinLibraryAlias aliaseeTypeName).
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryAttribute: aJinLibraryAttribute [

	| attr |
	attr := self instantiate: JinDAMAttribute.
	attr name: aJinLibraryAttribute name.
	attr typeName:
		(self typeNameReference: aJinLibraryAttribute typeName).
	attr isConstant: false.
	attr visibility: ((self state top isKindOf: JinDAMClass)
			 ifTrue: [ #Private ]
			 ifFalse: [ #Public ]).
	attr anchor: (self dllAnchor: attr name for: aJinLibraryAttribute).
	self state top addMember: attr
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryCoClass: aJinLibraryCoClass [

	| obj typeName |
	typeName := aJinLibraryCoClass linkedType
		            ifNil: [ self undefinedTypeReference ]
		            ifNotNil: [ 
		            self typeNameReference:
			            aJinLibraryCoClass linkedType name ].
	obj := self instantiate: JinDAMAlias.
	self state top addType: obj.
	obj name: aJinLibraryCoClass name.
	obj anchor:
		self state top anchor / #coclass / aJinLibraryCoClass name.
	obj typeName: typeName.
	

"visitLibraryCoClass: aJinLibraryCoClass

	| attr typeName |
	attr := self instantiate: AlcixAttribute.
	attr visibility: #Public.
	attr name: aJinLibraryCoClass name.
	attr anchor: (self dllAnchor: attr name for: aJinLibraryCoClass).
	attr isConstant: true.
	typeName := aJinLibraryCoClass linkedType
		            ifNil: [ self undefinedTypeReference ]
		            ifNotNil: [ 
		            self typeNameReference:
			            aJinLibraryCoClass linkedType name ].
	attr typeName: typeName.

	attr anchor: self state top anchor / #attributes / attr name.
	self state top addMember: attr"
]

{ #category : #accessing }
JinDAMLibraryReferenceImporter >> visitLibraryConstant: aJinLibraryConstant [

	| fn |
	fn := self instantiate: JinDAMAttribute.
	fn visibility: #Public.
	fn name: aJinLibraryConstant name.
	fn anchor: (self dllAnchor: fn name for: aJinLibraryConstant).
	aJinLibraryConstant type
		ifNil: [ fn typeName: self undefinedTypeReference ]
		ifNotNil: [ :t | fn typeName: (self typeNameReference: t) ].
	fn isConstant: true.
	fn anchor: self state top anchor / #attributes / fn name.
	self state top addMember: fn
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryDispatchInterface: aJinLibraryDispatchInterface [ 
	^ self visitLibraryInterface: aJinLibraryDispatchInterface
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryEnum: aJinLibraryEnum [

	| en |
	en := self instantiate: JinDAMEnum.
	en name: aJinLibraryEnum name.
	en anchor: self state top anchor / #types / en name.
	self state top addType: en.
	aJinLibraryEnum values do: [ :d | 
		en addEnumValue: ((self instantiate: JinDAMEnumValue)
				 name: d name;
				 Value: d value;
				 yourself) ]
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryFunction: aJinLibraryFunction [

	| fn selector |
	fn := self instantiate: JinDAMFunction.
	selector := ('_' split: aJinLibraryFunction selector) last.
	fn selector: selector.
	fn anchor: self state top anchor / #functions / fn selector.
	fn typeName: self undefinedTypeReference.
	self state top addInvocable: fn
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryInterface: aJinLibraryInterface [ 

	| obj |
	obj := self instantiate: JinDAMClass.
	self state top addType: obj.
	obj name: aJinLibraryInterface name.
	obj anchor: self state top anchor / #interfaces / aJinLibraryInterface name.

	self state push: obj.
	self visitCollection: aJinLibraryInterface definitions.

	self state pop
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryMethod: aJinLibraryMethod [ 
	| fn  selector |
	 
	fn := self instantiate: JinDAMFunction.
	selector :=( '_' split: aJinLibraryMethod selector) last.  
	fn selector: selector.
	fn anchor: self state top anchor / #functions / fn selector.
	fn typeName: (self typeName: aJinLibraryMethod) .
	
	self state top addInvocable: fn.
	self state push: fn.
	super visitLibraryMethod: aJinLibraryMethod.
	self state pop
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryModule: aModule [

	| obj |
	obj := self instantiate: JinDAMModule.
	self state top addType: obj.
	obj name: aModule name.
	obj anchor: self state top anchor / #modules / aModule name.

	self state push: obj.
	self visitCollection: aModule definitions.

	self state pop
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryParameter: aJinLibraryParameter [

	| param |
	param := self instantiate: JinDAMParameter.
	param name: aJinLibraryParameter name.
	param typeName: (self typeNameReference: aJinLibraryParameter type).
	param isOptional: aJinLibraryParameter isOptional.
	self state top addParameter: param
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryProperty: aJinLibraryProperty [

	| attribute  |
	attribute := self instantiate: JinDAMAttribute.
	attribute name: aJinLibraryProperty name.
	attribute anchor:
		(self dllAnchor: attribute name for: aJinLibraryProperty).

	attribute visibility: (aJinLibraryProperty name first = $_
			 ifTrue: [ #Private ]
			 ifFalse: [ #Public ]).

	attribute isConstant: false.
	attribute anchor:
		self state top anchor / #attributes / attribute name.

	self state top addMember: attribute.
	self assert: aJinLibraryProperty type isNil.

	aJinLibraryProperty getter ifNotNil: [ 
		self
			instantiateGetterAccessorMethod: aJinLibraryProperty getter
			into: attribute.
		attribute typeName: attribute attributeAccessors first typeName ].
	aJinLibraryProperty setter ifNotNil: [ 
		self
			instantiateSetterAccessorMethod: aJinLibraryProperty setter
			into: attribute ]
]

{ #category : #visiting }
JinDAMLibraryReferenceImporter >> visitLibraryStructure: aJinLibraryStructure [

	| obj |
	obj := self instantiate: JinDAMStructure.
	self state top addType: obj.
	obj name: aJinLibraryStructure name.
	obj anchor:
		self state top anchor / #structures / aJinLibraryStructure name.

	self state push: obj.
	self visitCollection: aJinLibraryStructure definitions.

	self state pop
]

{ #category : #'visit-first-objects' }
JinDAMLibraryReferenceImporter >> visitReference: aReference [ 
	aReference library accept: self 
]
