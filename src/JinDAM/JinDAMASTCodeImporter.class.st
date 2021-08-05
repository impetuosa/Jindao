Class {
	#name : #JinDAMASTCodeImporter,
	#superclass : #JinASTCodeVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#category : #'JinDAM-Importers'
}

{ #category : #anchor }
JinDAMASTCodeImporter >> codeAnchor: aString for: aVBModulePropertyNode [

	^ self state top anchor / aString / #'@src'
	  / aVBModulePropertyNode startPosition asString / #to
	  / aVBModulePropertyNode stopPosition asString
]

{ #category : #'as yet unclassified' }
JinDAMASTCodeImporter >> ensureInContextOf: aClass or: aClass2 [

	({ 
		 aClass.
		 aClass2 } anySatisfy: [ :c | self state top isKindOf: c ]) 
		ifFalse: [ self error: 'Unexpected context' ]
]

{ #category : #'member access' }
JinDAMASTCodeImporter >> instantiateAccess: aMemberOrDictAccess [

	| read |
	read := self instantiateAccessForReference:
		        (self nodeToVariableReferenceName: aMemberOrDictAccess).
	read anchor:
		(self codeAnchor: read printString for: aMemberOrDictAccess).
	^ read
]

{ #category : #'member access' }
JinDAMASTCodeImporter >> instantiateAccessForReference: aReference [
	| access |
	access := self instantiate: JinDAMAccessRead.
	access isWriting: false.
	access
		rightElementName: aReference.
	^ access
]

{ #category : #invocations }
JinDAMASTCodeImporter >> instantiateFlatInvocation: selector for: aCall [

	| call |
	call := self instantiate: JinDAMInvocation.
	call selector: selector.
	call anchor:
		(self codeAnchor: (self nodeToString: aCall selector) for: aCall).
	aCall arguments ifNotNil: [ :r | 
		r arguments do: [ :a | 
			| arg |
			arg := self instantiate: JinDAMArgument.
			arg value: (self nodeToString: a).
			call addArgument: arg ] ].
	self state top addOutgoingInvocation: call
]

{ #category : #invocations }
JinDAMASTCodeImporter >> instantiateInvocation: aCall [
	| selector |
	aCall selector ifNil: [ self flag: #ShouldManageArrayAccessInHere . ^ self ].
	selector := self nodeToInvocableReferenceName: aCall selector.
	selector selectorSeemsToBeMethodInvocation
		ifTrue: [ self instantiateMethodInvocation: selector for: aCall ]
		ifFalse: [ self instantiateFlatInvocation: selector for: aCall ]
]

{ #category : #invocations }
JinDAMASTCodeImporter >> instantiateMethodInvocation: selector for: aCall [

	| receiver call |
	receiver := self instantiateAccessForReference:
		            selector dropReceiverOutOfSelector.

	receiver anchor: (self codeAnchor: receiver printString for: aCall).
	self state top addAccess: receiver.
	call := self instantiate:JinDAMMethodInvocation.
	call receiver: receiver.
	call selector: selector.
	call anchor: (self codeAnchor: selector printString for: aCall).

	aCall arguments ifNotNil: [ :col | col arguments do: [ :a | 
		| arg |
		arg := self instantiate: JinDAMArgument.
		arg value: (self nodeToString: a).
		call addArgument: arg ].].
	self state top addOutgoingInvocation: call
]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> instantiateVariable: aClass from: aVariable [

	| var |
	var := self instantiate: aClass.
	var name: (self nodeToString: aVariable name).
	var typeName: (self typeName: aVariable type).
	var instantiatesObjectOnDefinition:
		aVariable type class = VBAsTypeAndNewNode.
	var anchor: (self codeAnchor: var name for: aVariable).

	^ var
]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> registerSpecialVariable: aName type: aType [
	| var |
	var := self instantiate: JinDAMAttribute.
	var name: aName.
	var typeName: (self typeNameReference: aType name).
	var type: aType.
	var anchor: self state top anchor / #variables / var name.
	^ var
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
			fn := self instantiate: JinDAMAttribute.
			fn visibility: #Public.
			self state top addMember: fn ]
		ifFalse: [ 
			(self state top isKindOf: JinDAMInvocable)
				ifTrue: [ 
					fn := self instantiate: JinDAMLocalVariable.
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
				 Value: i;
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
		| name |
		name := self nodeToString: d name.
		d type sizes ifNotEmpty: [ 
			name := name
			        ,
			        ('-' join:
				         (d type sizes collect: [ :d2 | self nodeToString: d2 ])) ].
		self assert: d type class = VBTypedThingNode.
		en addMember: ((self instantiate: JinDAMAttribute)
				 anchor: (self codeAnchor: name for: d);
				 name: name;
				 typeName: (self nodeToTypeReferenceName: d type type);
				 visibility: #Public;
				 yourself) ]
]

{ #category : #'member access' }
JinDAMASTCodeImporter >> visitDictionaryAccess: aDictionaryAccess [
	self state top addAccess: (self instantiateAccess: aDictionaryAccess)
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
		self state top addMember: var.
		^ self ].
	self error: 'Unexpected case .'
]

{ #category : #assignments }
JinDAMASTCodeImporter >> visitEquals: anAssignementOrEquals [

	| access |
	"
	Ensure that is an assignment: 
	"
	anAssignementOrEquals isAssignment
		ifTrue: [ 
			access := self instantiate: JinDAMAccessWrite.
			access isReturn: anAssignementOrEquals isReturn.
			access anchor: (self
					 codeAnchor: (self writeStringSelector: anAssignementOrEquals)
					 for: anAssignementOrEquals).
			access isWriting: true.
			access leftElementName:
				(self nodeToVariableReferenceName: anAssignementOrEquals left).
			access rightElementName:
				(self nodeToVariableReferenceName: anAssignementOrEquals right).
			self state top addAccess: access ]
		ifFalse: [ anAssignementOrEquals left acceptVisitor: self ].
	anAssignementOrEquals right acceptVisitor: self
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitEvent: anEvent [
	| fn |
	
	fn := self instantiate: JinDAMEvent.
	fn selector: (self nodeToString: anEvent selector).
	fn anchor: self state top anchor / #events / fn selector.
	self state top addInvocable: fn.
	self state push: fn.
	super visitEvent: anEvent.
	self state pop
]

{ #category : #assignments }
JinDAMASTCodeImporter >> visitExplicitAssignement: anExplicitAssignement [

	| access |
	access := self instantiate: JinDAMAccessWrite.
	access isReturn: (anExplicitAssignement isReturn).
	access anchor: (self
			 codeAnchor: (self writeStringSelector: anExplicitAssignement)
			 for: anExplicitAssignement).
	access isWriting: true.
	access leftElementName:
		(self nodeToVariableReferenceName: anExplicitAssignement left).
	access rightElementName:
		(self nodeToVariableReferenceName: anExplicitAssignement right).
	access isNewObject: (anExplicitAssignement right isKindOf: VBNewClauseNode).
	self state top addAccess: access.
	anExplicitAssignement right acceptVisitor: self
]

{ #category : #invocations }
JinDAMASTCodeImporter >> visitExplicitCall: anExplicitCall [

	| param |
	param := anExplicitCall selector isIdentifier
		         ifTrue: [ anExplicitCall ]
		         ifFalse: [ anExplicitCall selector ].
	self instantiateInvocation: param.
	anExplicitCall arguments ifNotNil: [ :a | a acceptVisitor: self ]
]

{ #category : #'functions - subs - events' }
JinDAMASTCodeImporter >> visitExternalFunction: aDefinition [

	| fn |
	fn := self instantiate: JinDAMExternalFunction.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor: self state top anchor / #functions / fn selector / #'@src'
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
		fn typeName: (self typeName: aDefinition type).
		fn typeAnchor: self state top anchor / #functions
			/ fn typeName adaptToAlceAnchorPathFragment / #'@src'
			/ aDefinition type startPosition asString / #to
			/ aDefinition type stopPosition asString.

		return typeName: (self typeName: aDefinition type) ].



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
	self instantiateInvocation: anImplicitParenthesesLessCall.
	anImplicitParenthesesLessCall arguments acceptVisitor: self
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitLabel: aLabel [ 	
	
]

{ #category : #'avoiding visit' }
JinDAMASTCodeImporter >> visitLabelTag: aLabel [ 	
	
]

{ #category : #'member access' }
JinDAMASTCodeImporter >> visitMemberAccess: aMemberAccess [
	self state top addAccess: (self instantiateAccess: aMemberAccess)
]

{ #category : #'type definition' }
JinDAMASTCodeImporter >> visitModule: aModule [
	(self state top isKindOf: JinDAMClass) ifTrue: [ 
		self state top addMember:
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
	fn typeName: (self typeName: aModuleProperty variable type).
	fn visibility: (aModuleProperty visibility
			 ifNil: [ #Private ]
			 ifNotNil: [ self nodeToString: aModuleProperty visibility ])
			asSymbol.
	fn isConstant: false.

	fn anchor: (self codeAnchor: fn name for: aModuleProperty).
	self state top addMember: fn
]

{ #category : #'properties - variables' }
JinDAMASTCodeImporter >> visitModulePropertyGet: aModulePropertyGet [

	| acc statement kindSymbol attributeName |
	acc := self instantiate:JinDAMAttributeAccessor.
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
				acc typeName: (self typeName: aModulePropertyGet type).
				acc typeAnchor: self state top anchor / #accessors
					/ acc typeName adaptToAlceAnchorPathFragment / #'@src'
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
			 self state top members
				 detect: [ :p | p name = attributeName ]
				 ifNone: [ nil ] ]).
	self state push: acc.
	aModulePropertyGet parameters acceptVisitor: self.
	self state pop
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
JinDAMASTCodeImporter >> visitParameter: aParameter [

	| param |
	param := self instantiate: JinDAMParameter.
	param name: (self nodeToString: aParameter name).
	param typeName: (self typeName: aParameter type).
	param isOptional: aParameter isOptional.
	param anchor: (self codeAnchor: param name for: aParameter ).
	self state top addParameter: param
]

{ #category : #invocations }
JinDAMASTCodeImporter >> visitProcedureCallOrArrayAccess: aProcedureCallOrArrayAccess [
	self instantiateInvocation: aProcedureCallOrArrayAccess.
	aProcedureCallOrArrayAccess arguments acceptVisitor: self
]

{ #category : #generated }
JinDAMASTCodeImporter >> visitRaiseError: aRaiseError [
	^ self visitProgram: aRaiseError.

]

{ #category : #invocations }
JinDAMASTCodeImporter >> visitRaiseEvent: aRaiseEvent [

	| call args sel |
	args := (aRaiseEvent selector class name asLowercase includesSubstring: 
		         'identifier')
		        ifTrue: [ 
			        sel := aRaiseEvent selector.
			        args := #(  ) ]
		        ifFalse: [ 
			        sel := aRaiseEvent selector selector.
			        args := aRaiseEvent selector arguments arguments ].
	call := self instantiate: JinDAMRaiseEvent.
	call selector: (self nodeToInvocableReferenceName: sel).
	call anchor: (self codeAnchor: call selector for: aRaiseEvent).

	args do: [ :a | 
		| arg |
		arg := self instantiate: JinDAMArgument.
		arg value: (self nodeToString: a).
		call addArgument: arg ].
	self state top addOutgoingInvocation: call.
	super visitRaiseEvent: aRaiseEvent
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
	(self state top isKindOf: JinDAMInvocable)
		ifTrue: [ self state top
				addAccess: (self instantiateAccess: aSimpleIdentifier) ]
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
