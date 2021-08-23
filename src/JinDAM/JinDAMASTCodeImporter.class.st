Class {
	#name : #JinDAMASTCodeImporter,
	#superclass : #JinASTCodeVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#instVars : [
		'literals',
		'referenceTaggedNameConverter'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #anchor }
JinDAMASTCodeImporter >> codeAnchor: aString for: aVBModulePropertyNode [

	^ self state top anchor / aString / #'@src'
	  / aVBModulePropertyNode startPosition asString / #to
	  / aVBModulePropertyNode stopPosition asString
]

{ #category : #'as yet unclassified' }
JinDAMASTCodeImporter >> codeElementReferenceName: aString context: aJinDAMAccessRead [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinDAMASTCodeImporter >> enclosingClass [

	^ self state detect: [ :s | s isKindOf: JinDAMClass ]
]

{ #category : #'as yet unclassified' }
JinDAMASTCodeImporter >> ensureInContextOf: aClass or: aClass2 [

	({ 
		 aClass.
		 aClass2 } anySatisfy: [ :c | self state top isKindOf: c ]) 
		ifFalse: [ self error: 'Unexpected context' ]
]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> instantiateVariable: aClass from: aVariable [

	| var |
	var := self instantiate: aClass.
	var name: (self nodeToString: aVariable name).
	var typeReference: (self typeName: aVariable type context: var).
	var instantiatesObjectOnDefinition:
		aVariable type class = VBAsTypeAndNewNode.
	var anchor: (self codeAnchor: var name for: aVariable).

	^ var
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> literals [
	 ^ literals ifNil: [ literals := Dictionary new  ]
]

{ #category : #'as yet unclassified' }
JinDAMASTCodeImporter >> nodeToTypeReferenceName: aVBNode context: aContext [

	| t |
	t := self referenceNameConverter
		     toTypeReferenceName: aVBNode
		     context: aContext.
"	self assert: (t isKindOf: JinDAMTypeReference)."
	^ t
]

{ #category : #'member access' }
JinDAMASTCodeImporter >> referenceTaggedNameConverter [

	^ referenceTaggedNameConverter ifNil: [ 
		  referenceTaggedNameConverter := JinDAMVBVisitorToTaggedReferenceName
			                                  new ]
]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> registerSpecialVariable: aName type: aType [

	| var |
	var := self instantiate: JinDAMAttribute.
	var name: aName.
	var typeReference: (self typeReferenceName: aType name type: aType context: var).
	var anchor: self state top anchor / #variables / var name.
	^ var
]

{ #category : #generated }
JinDAMASTCodeImporter >> visitArgument: anArgument [

	| arg |
	"	EL ARGUMENTO SE ESTA TRATANDO DE AGREGAR A OTRO ARGUMENTO POR UQE NO ESTOY MANEJANDO BIEN EL TYPEOF (TYPEOF ES VISITADO COMO NODO A PARTE,PERO DEBIERA PRODUCIR UNA LLAMADA A FUNCION)"
	self assert: (self state top isReference or: [ 
			 self state top isKindOf: JinDAMAccessRead ]).

	arg := self instantiate: JinDAMArgument.

	arg text: (self nodeToString: anArgument).
	self state top addArgument: arg.
	self state push: arg.
	anArgument value acceptVisitor: self.
	self state pop
]

{ #category : #generated }
JinDAMASTCodeImporter >> visitArgumentList: anArgumentList [

	self visitCollection: anArgumentList arguments
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitBooleanLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitColorLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #generated }
JinDAMASTCodeImporter >> visitComparisonOperation: aComparisonOperation [
	^ self visitProgram: aComparisonOperation.

]

{ #category : #'type definition' }
JinDAMASTCodeImporter >> visitConstant: aConstant [

	| fn |
	(self state top isKindOf: JinDAMModule)
		ifTrue: [ 
			fn := self instantiate: JinDAMConstant.
			self state top addAttribute: fn ]
		ifFalse: [ 
			(self state top isKindOf: JinDAMInvocable)
				ifTrue: [ 
					fn := self instantiate: JinDAMConstant.
					self state top addLocalVariable: fn ]
				ifFalse: [ ^ self error: 'un expected ' ] ].


	fn name: (self nodeToString: aConstant constant).
	fn anchor: (self codeAnchor: fn name for: aConstant).

	fn isConstant: true.


	self state push: fn.
	super visitConstant: aConstant.
	self state pop
]

{ #category : #generated }
JinDAMASTCodeImporter >> visitConstantList: aConstantList [
	^ self visitProgram: aConstantList.

]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitDateLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #'type definition' }
JinDAMASTCodeImporter >> visitDefType: aDefType [
	^ self error: ' Def type is a really really really crappy thing '

]

{ #category : #'type definition' }
JinDAMASTCodeImporter >> visitDefineEnum: aDefineEnum [

	| en i |
	en := self instantiate: JinDAMEnum.
	en name: (self nodeToString: aDefineEnum name).
	en anchor: self state top anchor / #types / en name.
	self state top addType: en.
	i := 0.
	aDefineEnum fields do: [ :d | 
		i := d value ifNil: [ i + 1 ] ifNotNil: [ :v | 
			     (v isKindOf: VBMemberAccessNode)
				     ifTrue: [ self nodeToString: v ]
				     ifFalse: [ 
					     (v isKindOf: VBNegatedOperationNode)
						     ifTrue: [ -1 * v value token value asNumber ]
						     ifFalse: [ 
							     [ v token value asNumber ]
								     on: Error
								     do: [  v source  ] ] ] ].


		en addEnumValue: ((self instantiate: JinDAMEnumValue)
				 name: (self nodeToString: d name);
				 value: i;
				 yourself) ]
]

{ #category : #'type definition' }
JinDAMASTCodeImporter >> visitDefineType: aDefineType [

	| en |
	en := self instantiate: JinDAMUserType.
	en name: (self nodeToString: aDefineType name).
	en anchor: self state top anchor / #types / en name.
	self state top addType: en.
	aDefineType fields doWithIndex: [ :d :i | 
		| name attr |
		name := self nodeToString: d name.
		d type sizes ifNotEmpty: [ 
			name := name
			        ,
			        ('-' join:
				         (d type sizes collect: [ :d2 | self nodeToString: d2 ])) ].
		self assert: d type class = VBTypedThingNode.
		attr := self instantiate: JinDAMAttribute.
		attr
			anchor: (self codeAnchor: name for: d);
			name: name;
			visibility: #Public.
		attr typeReference: (self typeName: d type context: attr).



		en addAttribute: attr ]
]

{ #category : #'member access' }
JinDAMASTCodeImporter >> visitDictionaryAccess: aDictionaryAccess [

	| names tip read |
	names := aDictionaryAccess acceptVisitor:
		         self referenceTaggedNameConverter.

	read := self instantiate: JinDAMAccessRead.
	tip := self
		       instantiateReferenceForNames: names
		       context: read
		       preferring: { #isInvocable. #isAttribute. #isType }.

	read readReference: tip.
	self state top addAccess: read.
	^ read
]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> visitDimMultipleVariables: aDimMultipleVariables [

	| var |
	self ensureInContextOf: JinDAMInvocable or: JinDAMModule .
	(self state top isKindOf: JinDAMInvocable) ifTrue: [ 
		aDimMultipleVariables variables variables do: [ :v | 
			var := self instantiateVariable: JinDAMLocalVariable from: v.
			self state top addLocalVariable: var ] ].
	(self state top isKindOf: JinDAMModule) ifTrue: [ 
		aDimMultipleVariables variables variables do: [ :v | 
			var := self instantiateVariable: JinDAMAttribute from: v.
			var visibility: #Public.
			self state top addMember: var ].
		^ self ]
]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> visitDimVariable: aDimVariable [

	| var |
	(self state top isKindOf: JinDAMInvocable) ifTrue: [ 
		var := self
			       instantiateVariable: JinDAMLocalVariable
			       from: aDimVariable variable.
		self state top addLocalVariable: var.
		^ self ].
	(self state top isKindOf: JinDAMModule ) ifTrue: [ 
		var := self
			       instantiateVariable:JinDAMAttribute
			       from: aDimVariable variable.
		var visibility: #Public.
		self state top addAttribute: var.
		^ self ].
	self error: 'Unexpected case .'
]

{ #category : #assignments }
JinDAMASTCodeImporter >> visitEquals: anExplicitAssignement [

	| access write tempNames |
	anExplicitAssignement isAssignment
		ifTrue: [ 
			access := self instantiate: JinDAMAccessWrite.
			tempNames := anExplicitAssignement left acceptVisitor:
				             self referenceTaggedNameConverter.

			anExplicitAssignement isReturn
				ifFalse: [ 
					write := self
						         instantiateReferenceForNames: tempNames
						         context: access
						         preferring: { #isAttribute. #isType } ]
				ifTrue: [ 
					write := self
						         instantiateReferenceForNames: tempNames
						         context: access
						         preferring: { #isInvocable } ].

			self state push: access.
			access processingRead.
			anExplicitAssignement right acceptVisitor: self.
			access processingFinished .
			self state pop.


			access
				writeReference: write;
				isReturn: anExplicitAssignement isReturn.
			self assert: access hasReads.

			access isNewObject:
				(anExplicitAssignement right isKindOf: VBNewClauseNode).

			self state top addAccess: access.
			^ access ]
		ifFalse: [ anExplicitAssignement right acceptVisitor: self ]
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitEvent: anEvent [
	| fn |
	fn := self instantiate: JinDAMEvent.
	fn selector: (self nodeToString: anEvent selector).
	fn anchor: self state top anchor / #events / fn selector.
	self state top addInvocable: fn.
	self state push: fn.
	anEvent parameters acceptVisitor: self.
	self state pop
]

{ #category : #assignments }
JinDAMASTCodeImporter >> visitExplicitAssignement: anExplicitAssignement [

	| access tempNames |
	access := self instantiate: JinDAMAccessWrite.


	"
	tempNames := anExplicitAssignement left acceptVisitor:
		             self referenceTaggedNameConverter.
	anExplicitAssignement isReturn
		ifFalse: [ 
			write := self
				         instantiateReferenceForNames: tempNames
				         context: access
				         preferring: { #isAttribute . #isSet . #isLet} ]
		ifTrue: [ 
			write := self
				         instantiateReferenceForNames: tempNames
				         context: access
				         preferring: { #isInvocable } ]."

	self state push: access.
	access processingWrite.
	anExplicitAssignement left acceptVisitor: self.
	access processingRead.
	anExplicitAssignement right acceptVisitor: self.
	access processingFinished.
	self state pop.

	access isReturn: anExplicitAssignement isReturn.
	self assert: access hasReads.

	access isNewObject:
		(anExplicitAssignement right isKindOf: VBNewClauseNode).

	self state top addAccess: access.

	^ access
]

{ #category : #invocations }
JinDAMASTCodeImporter >> visitExplicitCall: anExplicitCall [
	anExplicitCall selector acceptVisitor: self 
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitExternalFunction: aDefinition [

	| fn |
	fn := self instantiate: JinDAMExternalFunction.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor:
		self state top anchor / #functions / fn selector / #'@src'
		/ aDefinition startPosition asString / #to
		/ aDefinition stopPosition asString.
		
	
	fn libraryName: (self nodeToString: aDefinition library).
	fn typeReference: (self typeName: aDefinition type context: fn).

	aDefinition alias ifNotNil: [ 
		fn alias: (self nodeToString: aDefinition alias) ].
	aDefinition visibility
		ifNil: [ fn visibility: #Public ]
		ifNotNil: [ 
		fn visibility: (self nodeToString: aDefinition visibility) ].

	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self.
	self state pop
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitExternalSub: aDefinition [

	| fn |
	fn := self instantiate: JinDAMExternalSubProcedure.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor:
		self state top anchor / #functions / fn selector / #'@src'
		/ aDefinition startPosition asString / #to
		/ aDefinition stopPosition asString.

	fn libraryName: (self nodeToString: aDefinition library).
	aDefinition alias ifNotNil: [ 
		fn alias: (self nodeToString: aDefinition alias) ].

	aDefinition visibility
		ifNil: [ fn visibility: #Public ]
		ifNotNil: [ 
		fn visibility: (self nodeToString: aDefinition visibility) ].


	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self.
	self state pop
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitFloatLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitFunctionDefinition: aDefinition [

	| fn return |
	fn := self instantiate: JinDAMFunction.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor:
		self state top anchor / #functions / fn selector / #'@src'
		/ aDefinition startPosition asString / #to
		/ aDefinition stopPosition asString.
	" Addin a local variable with the name of the function to represent the 'returning assignation' "
	return := self instantiate: JinDAMLocalVariable.
	return name: (self nodeToString: aDefinition selector).
	return instantiatesObjectOnDefinition: false.
	return anchor: self state top anchor / #return / return name.
	fn addLocalVariable: return.
	
	aDefinition type ifNotNil: [ 
		fn typeReference: (self typeName: aDefinition type context: fn).
		fn typeAnchor: self state top anchor / #functions
			/ fn typeReference adaptToAlceAnchorPathFragment / #'@src'
			/ aDefinition type startPosition asString / #to
			/ aDefinition type stopPosition asString.
		return typeReference: (self typeName: aDefinition type context: return )].



	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self.
	aDefinition block acceptVisitor: self.
	self state pop
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitGoSub: aSubLabel [
	
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitGoSubLabel: aSubLabel [
	
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitGoToStatement: aStatement [
	
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitGuidLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #generated }
JinDAMASTCodeImporter >> visitHeader: aHeader [
	^ self visitProgram: aHeader.

]

{ #category : #generated }
JinDAMASTCodeImporter >> visitImplements: anImplements [
	^ self visitProgram: anImplements.

]

{ #category : #invocations }
JinDAMASTCodeImporter >> visitImplicitParenthesesLessCall: anImplicitParenthesesLessCall [

	| element |
	element := anImplicitParenthesesLessCall selector acceptVisitor: self.

	" Element should be either an access or an invocation. both cases it may have arguments (either for invocation or array access). "

	" Can we visit the arguments? we may need to add them as arguments int o the element."
	self state push: element.

	anImplicitParenthesesLessCall arguments acceptVisitor: self.
	self state pop
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitIntegerLiteral: aLiteral [ 
	^ self visitLiteral: aLiteral 
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitLabel: aLabel [ 	
	
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitLabelTag: aLabel [ 	
	
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitLiteral: aLiteral [

	| l read name |
	l := self literals
		     at: aLiteral token value , aLiteral className
		     ifAbsentPut: [ 
			     l := self instantiate: JinDAMLiteralReference.
			     l candidate: aLiteral token value.
			     name := aLiteral className
				             copyFrom: 3
				             to: aLiteral className size.
			     name := name copyReplaceAll: 'Literal' with: ''.
			     name := name copyReplaceAll: 'Node' with: ''.
			     l literalKind: name asSymbol.
			     l ].
	read := self instantiate: JinDAMAccessRead.

	read readReference: l.
	self state top addAccess: read
]

{ #category : #'member access' }
JinDAMASTCodeImporter >> visitMemberAccess: aMemberAccess [

	| names tip read |
	names :=  aMemberAccess acceptVisitor: self referenceTaggedNameConverter.

	read := self instantiate: JinDAMAccessRead.
	tip := self
		       instantiateReferenceForNames: names
		       context: read
		       preferring: { #isInvocable. #isAttribute. #isType }.

	read readReference: tip.
	self state top addAccess: read.
	^ read
]

{ #category : #'type definition' }
JinDAMASTCodeImporter >> visitModule: aModule [
	(self state top isKindOf: JinDAMClass) ifTrue: [ 
		self state top addAttribute:
			(self registerSpecialVariable: #Me type: self state top) ].
	^ self visitProgram: aModule
]

{ #category : #generated }
JinDAMASTCodeImporter >> visitModuleAttribute: aModuleAttribute [
	^ self visitProgram: aModuleAttribute.

]

{ #category : #generated }
JinDAMASTCodeImporter >> visitModuleConstant: aModuleConstant [
	^ self visitProgram: aModuleConstant.

]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> visitModuleProperty: aModuleProperty [

	| fn |
	fn := self instantiate: JinDAMAttribute.
	fn name: (self nodeToString: aModuleProperty variable name).
	fn typeReference: (self typeName: aModuleProperty variable type context: fn).
	fn visibility: (aModuleProperty visibility
			 ifNil: [ #Private ]
			 ifNotNil: [ self nodeToString: aModuleProperty visibility ])
			asSymbol.
	fn isConstant: false.

	fn anchor: (self codeAnchor: fn name for: aModuleProperty).
	self state top addAttribute: fn
]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> visitModulePropertyGet: aModulePropertyGet [

	| acc statement kindSymbol attributeName |
	acc := self instantiate: JinDAMAttributeAccessor.
	self state top addInvocable: acc.
	kindSymbol := aModulePropertyGet getToken ifNil: [ 
		              aModulePropertyGet setToken ].
	kindSymbol := kindSymbol ifNil: [ aModulePropertyGet letToken ].
	acc kind: kindSymbol value asSymbol.
	acc selector: (self nodeToString: aModulePropertyGet selector).

	acc anchor:
		self state top anchor / #accessors / acc selector / #'@src'
		/ aModulePropertyGet startPosition asString / #to
		/ aModulePropertyGet stopPosition asString.





	"Obtain property name from the body of the accessor "
	acc kind = #Get
		ifTrue: [ 
			aModulePropertyGet type ifNotNil: [ 
				acc typeReference: (self typeName: aModulePropertyGet type context: acc).
				acc typeAnchor: self state top anchor / #accessors
					/ acc typeReference adaptToAlceAnchorPathFragment  / #'@src'
					/ aModulePropertyGet type startPosition asString / #to
					/ aModulePropertyGet type stopPosition asString ].



			statement := (aModulePropertyGet block statements select: [ :s | 
				              { 
					              VBExplicitAssignementNode.
					              VBEqualsNode } includes: s class ])
				             detect: [ :s | 
				             (self nodeToString: s left) = acc selector ]
				             ifNone: [ nil ].
			attributeName := statement ifNotNil: [ 
				                 self nodeToString: statement right ] ]
		ifFalse: [ 
			statement := (aModulePropertyGet block allNodesSelect: [ :s | 
				              { 
					              VBExplicitAssignementNode.
					              VBEqualsNode } includes: s class ])
				             detect: [ :s | 
					             (self nodeToString: s right) = (self nodeToString:
						              aModulePropertyGet parameters parameters first
							              name) ]
				             ifNone: [ nil ].
			attributeName := statement ifNotNil: [ 
				                 self nodeToString: statement left ] ].


	acc attribute: (attributeName ifNotNil: [ 
			 self state top attributes
				 detect: [ :p | p name = attributeName ]
				 ifNone: [ nil ] ]).
	self state push: acc.
	aModulePropertyGet parameters acceptVisitor: self.
	self state pop
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitNull: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitOnErrorGoTo: aStatement [
	
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitOnErrorResumeNext: aStatement [
	
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitOnExpressionGo: aStatement [
	
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitOptionBase: anOptionBase [

]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitParameter: aParameter [

	| param |
	param := self instantiate: JinDAMParameter.
	param name: (self nodeToString: aParameter name).
	param typeReference:  (self typeName: aParameter type context: param).
	param isOptional: aParameter isOptional.
	param anchor: (self codeAnchor: param name for: aParameter ).
	self state top addParameter: param
]

{ #category : #invocations }
JinDAMASTCodeImporter >> visitProcedureCallOrArrayAccess: aProcedureCallOrArrayAccess [

	| element ref |
	self assert: (aProcedureCallOrArrayAccess selector isNil xor:
			 aProcedureCallOrArrayAccess receiver isNil).

	aProcedureCallOrArrayAccess selector
		ifNotNil: [ 
		element := aProcedureCallOrArrayAccess selector acceptVisitor: self ]
		ifNil: [ 
			element := self instantiate: JinDAMAccessRead.
			ref := aProcedureCallOrArrayAccess receiver acceptVisitor: self.
			ref := (self instantiate: JinDAMExpressionReference)
				       candidate: ref;
				       candidateAnchor: ref anchor;
				       context: element;
				       yourself.
			element readReference: ref ].


	" Element should be either an access or an invocation. both cases it may have arguments (either for invocation or array access). "

	" Can we visit the arguments? we may need to add them as arguments int o the element."
	self state push: element.

	aProcedureCallOrArrayAccess arguments acceptVisitor: self.
	self state pop.
	^ element
]

{ #category : #generated }
JinDAMASTCodeImporter >> visitRaiseError: aRaiseError [
	^ self visitProgram: aRaiseError.

]

{ #category : #invocations }
JinDAMASTCodeImporter >> visitRaiseEvent: aRaiseEvent [

	| element |
	element := aRaiseEvent selector acceptVisitor: self.

	" Element should be either an access or an invocation. both cases it may have arguments (either for invocation or array access). "

	" Can we visit the arguments? we may need to add them as arguments int o the element."
	self state push: element.

	aRaiseEvent arguments acceptVisitor: self.
	self state pop
]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> visitReDimVariable: aReDimVariable [

	self state top localVariables
		detect: [ :a | a name = aReDimVariable variable name token value ]
		ifFound: [ :e | 
		e redim: (self nodeToString: aReDimVariable variable type) ]
		ifNone: [  ]
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitResumeEmpty: aStatement [
	
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitResumeLabel: aResomeNext [ 	
	
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitResumeNext: aResomeNext [ 	
	
]

{ #category : #'member access' }
JinDAMASTCodeImporter >> visitSimpleIdentifier: aSimpleIdentifier [

	| read tip |
	({ 
		 JinDAMAccessWrite.
		 JinDAMInvocable.
		 JinDAMArgument } anySatisfy: [ :a | self state top isKindOf: a ]) 
		ifTrue: [ 
			read := self instantiate: JinDAMAccessRead.
			tip := self
				       instantiateReferenceForNames:
				       { {aSimpleIdentifier token value . #member }}
				       context: read
				       preferring: { #isAttribute. #isInvocable }.
			read readReference: tip.
			self state top addAccess: read ].

	read ifNil: [ 
		({ 
			 JinDAMAttribute.
			 JinDAMConstant } anySatisfy: [ :a | self state top isKindOf: a ]) 
			ifFalse: [ self error: 'What is the symbol? ' ] ].

	^ read
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitStringLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitSubDefinition: aDefinition [
	| fn |
	fn := self instantiate: JinDAMSubProcedure.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor: self state top anchor / #subprocedures / fn selector / #'@src'
		/ aDefinition startPosition asString / #to
		/ aDefinition stopPosition asString..
	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self. 
	aDefinition block acceptVisitor: self.
	self state pop
]

{ #category : #'type definition' }
JinDAMASTCodeImporter >> visitTypeOf: aTypeOf [

	| element tip |
	element := self instantiate: JinDAMAccessRead.
	tip := self
		       instantiateReferenceForNames: { 'TypeOf' }
		       context: element
		       preferring: { #isInvocable. #isAttribute. #isType }.

	element readReference: tip.
	self state top addAccess: element.

	" Element should be either an access or an invocation. both cases it may have arguments (either for invocation or array access). "

	" Can we visit the arguments? we may need to add them as arguments int o the element."
	self state push: element.

	aTypeOf argument acceptVisitor: self.
	aTypeOf type acceptVisitor: self.
	self state pop.
	^ element
]

{ #category : #generated }
JinDAMASTCodeImporter >> visitVariable: aVariable [
	^ self visitProgram: aVariable.

]

{ #category : #generated }
JinDAMASTCodeImporter >> visitVariableList: aVariableList [
	^ self visitProgram: aVariableList.

]

{ #category : #assignments }
JinDAMASTCodeImporter >> writeStringSelector: anExplicitAssignement [

	^ (self nodeToString: anExplicitAssignement left) , '='
	  , (self nodeToString: anExplicitAssignement right)
]
