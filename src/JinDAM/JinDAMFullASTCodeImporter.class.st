Class {
	#name : #JinDAMFullASTCodeImporter,
	#superclass : #JinFullASTCodeVisitor,
	#traits : 'JinDAMTypeConversions',
	#classTraits : 'JinDAMTypeConversions classTrait',
	#instVars : [
		'literals',
		'referenceTaggedNameConverter'
	],
	#category : #'JinDAM-Importers'
}

{ #category : #visiting }
JinDAMFullASTCodeImporter >> acceptVisitor: aMOJinDAMImporter [

	^ aMOJinDAMImporter visitJinDAMFullASTCodeImporter: self
]

{ #category : #'as yet unclassified' }
JinDAMFullASTCodeImporter >> choose: symbols accordingToOrderedRules: rules [

	rules do: [ :r | 
		(symbols select: [ :s | s kind perform: r ]) ifNotEmpty: [ :col | 
			^ col ] ].
	self halt
]

{ #category : #anchor }
JinDAMFullASTCodeImporter >> codeAnchor: aString for: aVBModulePropertyNode [

	^ self state top anchor / aString / #'@src'
	  / aVBModulePropertyNode startPosition asString / #to
	  / aVBModulePropertyNode stopPosition asString
]

{ #category : #'as yet unclassified' }
JinDAMFullASTCodeImporter >> codeElementReferenceName: aString context: aJinDAMAccessRead [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinDAMFullASTCodeImporter >> enclosingClass [

	^ self state detect: [ :s | s isKindOf: JinDAMClass ]
]

{ #category : #'as yet unclassified' }
JinDAMFullASTCodeImporter >> ensureInContextOf: aClass or: aClass2 [

	({ 
		 aClass.
		 aClass2 } anySatisfy: [ :c | self state top isKindOf: c ]) 
		ifFalse: [ self error: 'Unexpected context' ]
]

{ #category : #'properties - variables' }
JinDAMFullASTCodeImporter >> instantiateVariable: aClass from: aVariable [

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
JinDAMFullASTCodeImporter >> literals [
	 ^ literals ifNil: [ literals := Dictionary new  ]
]

{ #category : #'as yet unclassified' }
JinDAMFullASTCodeImporter >> nodeToTypeReferenceName: aVBNode context: aContext [

	| t |
	t := self referenceNameConverter
		     toTypeReferenceName: aVBNode
		     context: aContext.
"	self assert: (t isKindOf: JinDAMTypeReference)."
	^ t
]

{ #category : #'as yet unclassified' }
JinDAMFullASTCodeImporter >> problematicForms [
	^ parent problematicForms 
]

{ #category : #'member access' }
JinDAMFullASTCodeImporter >> referenceTaggedNameConverter [

	^( referenceTaggedNameConverter ifNil: [ 
		  referenceTaggedNameConverter := JinDAMVBVisitorToTaggedReferenceName
			                                  new ]) importer: self; yourself 
]

{ #category : #'properties - variables' }
JinDAMFullASTCodeImporter >> registerSpecialVariable: aName type: aType [

	| var |
	var := self instantiate: JinDAMAttribute.
	var name: aName.
	var typeReference: (self typeReferenceName: aType name type: aType context: var).
	var anchor: self state top anchor / #variables / var name.
	^ var
]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitArgument: anArgument [

	| arg expression |
	"	EL ARGUMENTO SE ESTA TRATANDO DE AGREGAR A OTRO ARGUMENTO POR UQE NO ESTOY MANEJANDO BIEN EL TYPEOF (TYPEOF ES VISITADO COMO NODO A PARTE,PERO DEBIERA PRODUCIR UNA LLAMADA A FUNCION)"
	self assert: (self state top isReference or: [ 
			 self state top isKindOf: JinDAMAccessRead ]).

	arg := self instantiate: JinDAMArgument.

	arg text: (self nodeToString: anArgument).
	arg anchor: (self codeAnchor: #argument for: anArgument).
	self state top addArgument: arg.
	self state push: arg.
	expression := anArgument value acceptVisitor: self.
	self state pop.
	arg reads size = 1 ifFalse: [ 
		((expression isKindOf: JinDAMBinaryOperation) or: [ 
			 (expression isKindOf: JinDAMParentesis) or: [ 
				 expression isKindOf: JinDAMUnaryOperation ] ]) ifFalse: [ 
			self halt ] ].
	arg expression: expression.
	^ arg
]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitArgumentList: anArgumentList [

	^ self visitCollection: anArgumentList arguments
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitArithmeticOperation: aVBArithmeticOperationNode [ 
	^ self visitComparisonOperation: aVBArithmeticOperationNode
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitBlock: aVBBlockNode [

	| block |
	block := self instantiate: JinDAMBlock.
	block statements: (self visitCollection: aVBBlockNode statements).
	^ block
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitBooleanLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitCase: aVBCaseNode [

	^ (self instantiate: JinDAMCase)
		  expressions: (self visitCollection: aVBCaseNode expressions);
		  block: (aVBCaseNode body acceptVisitor: self);
		  yourself
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitColorLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitComparisonOperation: aComparisonOperation [

	| comp |
	comp := self instantiate: JinDAMBinaryOperation.

	aComparisonOperation tokenVariables do: [ :r | 
		(aComparisonOperation perform: r) ifNotNil: [ :token | 
			comp operator: token value asSymbol ] ].

	comp left: (aComparisonOperation left acceptVisitor: self).
	comp right: (aComparisonOperation right acceptVisitor: self).
	^ comp
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitConcatenationOperation: aVBConcatenationOperationNode [ 

	| comp |
	comp := self instantiate: JinDAMBinaryOperation.

	aVBConcatenationOperationNode tokenVariables do: [ :r | 
		(aVBConcatenationOperationNode perform: r) ifNotNil: [ :token | 
			comp operator: token value asSymbol ] ].

	comp left: (aVBConcatenationOperationNode left acceptVisitor: self).
	comp right: (aVBConcatenationOperationNode right acceptVisitor: self).
	^ comp
]

{ #category : #'type definition' }
JinDAMFullASTCodeImporter >> visitConstant: aConstant [

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
	fn initializer: (aConstant value acceptVisitor: self).


	^ fn
]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitConstantList: aConstantList [
	^ self visitProgram: aConstantList.

]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitDateLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #'type definition' }
JinDAMFullASTCodeImporter >> visitDefType: aDefType [
	^ self error: ' Def type is a really really really crappy thing '

]

{ #category : #'type definition' }
JinDAMFullASTCodeImporter >> visitDefineEnum: aDefineEnum [

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
JinDAMFullASTCodeImporter >> visitDefineType: aDefineType [

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

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitDestinationList: aVBDestinationListNode [

	^ aVBDestinationListNode labels collect: [ :l | 
		  (self instantiate: JinDAMLabelReference)
			  name: l token value;
			  anchor: self state top anchor / #label / l token value;
			  context: self state top;
			  yourself ]
]

{ #category : #'member access' }
JinDAMFullASTCodeImporter >> visitDictionaryAccess: aDictionaryAccess [

	| names tip read |
	names := aDictionaryAccess acceptVisitor:
		         self referenceTaggedNameConverter.

	read := self instantiate: JinDAMAccessRead.
	tip := self
		       instantiateReferenceForNames: names
		       context: read
		       preferring: { #isInvocable. #isAttribute. #isType }.
	read anchor:
		(self codeAnchor: #dictionaryRead for: aDictionaryAccess).
	read readReference: tip.
	self state top addAccess: read.
	^ read
]

{ #category : #'properties - variables' }
JinDAMFullASTCodeImporter >> visitDimMultipleVariables: aDimMultipleVariables [

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
			self state top addAttribute: var ].
		^ self ]
]

{ #category : #'properties - variables' }
JinDAMFullASTCodeImporter >> visitDimVariable: aDimVariable [

	| var |
	(self state top isKindOf: JinDAMInvocable) ifTrue: [ 
		var := self
			       instantiateVariable: JinDAMLocalVariable
			       from: aDimVariable variable.
		self state top addLocalVariable: var.
		^ var ].
	(self state top isKindOf: JinDAMModule ) ifTrue: [ 
		var := self
			       instantiateVariable:JinDAMAttribute
			       from: aDimVariable variable.
		var visibility: #Public.
		self state top addAttribute: var.
		^ var ].
	self error: 'Unexpected case .'
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitDoEvents: aVBDoEventsNode [

	| read tip |
	self assert: (self state top isKindOf: JinDAMInvocable).
	read := self instantiate: JinDAMAccessRead.
	tip := self
		       instantiateReferenceForNames: { { 
				       aVBDoEventsNode doEventsToken value.
				       #member } }
		       context: read
		       preferring: { #isAttribute. #isInvocable. #isType }.
	read readReference: tip.
	read anchor:
		(self codeAnchor: 'memberRead' for: aVBDoEventsNode doEventsToken).
	self state top addAccess: read.


	^ read
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitDoUntilTrue: aVBDoUntilTrueNode [

	^ self visitUntilTrue: aVBDoUntilTrueNode
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitDoWhileTrue: aVBDoWhileTrueNode [

	^ (self instantiate: JinDAMDoWhile)
		  condition: (aVBDoWhileTrueNode condition acceptVisitor: self);
		  block: (aVBDoWhileTrueNode body acceptVisitor: self)
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitElseIfBlock: aVBElseIfBlockNode [

	self assert: aVBElseIfBlockNode elseToken isNotNil.
	self assert: aVBElseIfBlockNode elseifToken isNil.
	^ aVBElseIfBlockNode ifMatch acceptVisitor: self
]

{ #category : #assignments }
JinDAMFullASTCodeImporter >> visitEquals: anExplicitAssignement [

	| access write tempNames |
	^ anExplicitAssignement isAssignment
		  ifTrue: [ 
			  access := self instantiate: JinDAMAccessWrite.
			  access anchor:
				  (self codeAnchor: #write for: anExplicitAssignement).
			  tempNames := anExplicitAssignement left acceptVisitor:
				               self referenceTaggedNameConverter.

			  anExplicitAssignement isReturn
				  ifFalse: [ 
					  write := self
						           instantiateReferenceForNames: tempNames
						           context: access
						           preferring: { #isAttribute. #isType. #isLet. #isSet } ]
				  ifTrue: [ 
					  write := self
						           instantiateReferenceForNames: tempNames
						           context: access
						           preferring: { #isInvocable } ].

			  self state push: access.
			  access processingRead.
			  access valueToAssign:
				  (anExplicitAssignement right acceptVisitor: self).
			  access processingFinished.
			  self state pop.

			  access assignedTo: write.

			  access
				  writeReference: write;
				  isReturn: anExplicitAssignement isReturn.
			  self assert: access hasReads.

			  access isNewObject:
				  (anExplicitAssignement right isKindOf: VBNewClauseNode).

			  self state top addAccess: access.
			  access ]
		  ifFalse: [ self visitComparisonOperation: anExplicitAssignement ]
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitEvent: anEvent [

	| fn |
	fn := self instantiate: JinDAMEvent.
	fn selector: (self nodeToString: anEvent selector).
	fn anchor: self state top anchor / #events / fn selector.
	self state top addInvocable: fn.
	self state push: fn.
	anEvent parameters acceptVisitor: self.
	self state pop.
	^ fn
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitExits: aVBExitsNode [ 
	^ self instantiate: JinDAMExit 
]

{ #category : #assignments }
JinDAMFullASTCodeImporter >> visitExplicitAssignement: anExplicitAssignement [

	| access |
	access := self instantiate: JinDAMAccessWrite.

	access anchor: (self codeAnchor: #write for: anExplicitAssignement).

	self state push: access.
	access processingWrite.
	access assignedTo:
		(anExplicitAssignement left acceptVisitor: self).
	access processingRead.
	access valueToAssign:
		(anExplicitAssignement right acceptVisitor: self).
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
JinDAMFullASTCodeImporter >> visitExplicitCall: anExplicitCall [

	^ anExplicitCall selector acceptVisitor: self
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitExternalFunction: aDefinition [

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
	self state pop.
	^ fn
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitExternalSub: aDefinition [

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
	self state pop.
	^ fn
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitFileDescriptorLiteral: aVBFileDescriptorLiteralNode [

	^ self visitLiteral: aVBFileDescriptorLiteralNode
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitFloatLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitForEach: aVBForEachNode [

	self assert: aVBForEachNode elements asSet size = 1.

	^ (self instantiate: JinDAMForEach)
		  each: (aVBForEachNode elements first acceptVisitor: self);
		  collection: (aVBForEachNode group acceptVisitor: self);
		  block: (aVBForEachNode body acceptVisitor: self);
		  yourself
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitForNext: aVBForNextNode [

	^ (self instantiate: JinDAMForNext)
		  counter: (aVBForNextNode counter acceptVisitor: self);
		  initialValue: (aVBForNextNode initialValue acceptVisitor: self);
		  limit: (aVBForNextNode limit acceptVisitor: self);
		  block: (aVBForNextNode body acceptVisitor: self);
		  yourself
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitForStepNext: aVBForStepNextNode [

	^ (self instantiate: JinDAMForStepNext)
		  counter: (aVBForStepNextNode counter acceptVisitor: self);
		  initialValue:
			  (aVBForStepNextNode initialValue acceptVisitor: self);
		  limit: (aVBForStepNextNode limit acceptVisitor: self);
		  step: (aVBForStepNextNode step acceptVisitor: self);
		  block: (aVBForStepNextNode body acceptVisitor: self);
		  yourself
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitFunctionDefinition: aDefinition [

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
		return typeReference:
			(self typeName: aDefinition type context: return) ].



	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self.
	fn block: (aDefinition block acceptVisitor: self).
	self state pop.
	^ fn
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitGoSub: aSubLabel [

	| goTo |
	goTo := self instantiate: JinDAMGoSub.
	goTo label: (aSubLabel destination acceptVisitor: self).
	^ goTo
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitGoSubLabel: aSubLabel [
			self halt 
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitGoToStatement: aStatement [

	| goTo |
	goTo := self instantiate: JinDAMGoTo.
	goTo labels: (aStatement destination acceptVisitor: self).
	^ goTo
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitGuidLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitHashIdentifier: aVBHashIdentifierNode [

	^ self visitSimpleIdentifier: aVBHashIdentifierNode
]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitHeader: aHeader [
	^ self visitProgram: aHeader.

]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitIfThenElse: aVBIfThenElseNode [

	| if |
	if := self instantiate: JinDAMIf.
	if condition: (aVBIfThenElseNode condition acceptVisitor: self).
	if ifTrue:
		(aVBIfThenElseNode ifTrue ifNotNil: [ :b | b acceptVisitor: self ]).
	if ifFalse:
		(aVBIfThenElseNode else ifNotNil: [ :b | b acceptVisitor: self ]).
	^ if
]

{ #category : #'member access' }
JinDAMFullASTCodeImporter >> visitImplements: anImplements [

	self assert: self state top species = JinDAMClass.
	^ self state top superClassReference: (self
			   typeReferenceName: anImplements interface token value
			   typeSymbol:
			   (self currentNamespace findSymbol:
				    anImplements interface token value)
			   context: self state top)
]

{ #category : #invocations }
JinDAMFullASTCodeImporter >> visitImplicitParenthesesLessCall: anImplicitParenthesesLessCall [

	| element args |

	element := anImplicitParenthesesLessCall selector acceptVisitor: self.

	" Element should be either an access or an invocation. both cases it may have arguments (either for invocation or array access). "

	" Can we visit the arguments? we may need to add them as arguments int o the element."
	self state push: element.
	args := anImplicitParenthesesLessCall arguments acceptVisitor: self.
	self assert: args = element readReference arguments.


	self state pop.
	^ element
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitIntegerLiteral: aLiteral [ 
	^ self visitLiteral: aLiteral 
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitLabel: aLabel [

	^ (self instantiate: JinDAMLabel)
		  labelName: aLabel label name value;
		  yourself
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitLabelTag: aLabel [ 	
			self halt 
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitLineInputClause: aVBLineInputClauseNode [

	^ (self instantiate: JinDAMFileLineInput)
		  fileDescriptorReference:
			  (aVBLineInputClauseNode fileNumber acceptVisitor: self);
		  inputReference: (aVBLineInputClauseNode value acceptVisitor: self);
		  yourself
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitLiteral: aLiteral [

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
			     l anchor:
				     (self codeAnchor: name asSymbol , ' literal' for: aLiteral).
			     l ].
	read := self instantiate: JinDAMAccessRead.
	read readReference: l.
	read anchor: (self codeAnchor: 'literalRead' for: aLiteral).
	self state top addAccess: read.
	^ read
]

{ #category : #'member access' }
JinDAMFullASTCodeImporter >> visitMemberAccess: aMemberAccess [

	| names tip read |
	names := aMemberAccess acceptVisitor:
		         self referenceTaggedNameConverter.

	read := self instantiate: JinDAMAccessRead.
	tip := self
		       instantiateReferenceForNames: names
		       context: read
		       preferring:
		       { #isInvocable. #isAttribute. #isType. #isAssembly }.

	read readReference: tip.
	read anchor: (self codeAnchor: 'memberRead' for: aMemberAccess).
	self state top addAccess: read.
	^ read
]

{ #category : #'type definition' }
JinDAMFullASTCodeImporter >> visitModule: aModule [
	(self state top isKindOf: JinDAMClass) ifTrue: [ 
		self state top addAttribute:
			(self registerSpecialVariable: #Me type: self state top) ].
	^ self visitProgram: aModule
]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitModuleAttribute: aModuleAttribute [
	^ self visitProgram: aModuleAttribute.

]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitModuleConstant: aModuleConstant [
	^ self visitProgram: aModuleConstant.

]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitModuleMultipleConstants: aVBModuleMultipleConstantsNode [

	^ aVBModuleMultipleConstantsNode constants acceptVisitor: self
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitModuleMultipleProperties: aVBModuleMultiplePropertiesNode [

	| vars visibility |
	vars := aVBModuleMultiplePropertiesNode variables acceptVisitor: self.

	aVBModuleMultiplePropertiesNode visibility ifNotNil: [ :vis | 
		visibility := vis value.
		vars do: [ :v | v visibility: visibility ] ].
	^ vars
]

{ #category : #'properties - variables' }
JinDAMFullASTCodeImporter >> visitModuleProperty: aModuleProperty [

	| fn |
	fn := self instantiate: JinDAMAttribute.
	fn name: (self nodeToString: aModuleProperty variable name).
	fn typeReference:
		(self typeName: aModuleProperty variable type context: fn).
	fn visibility: (aModuleProperty visibility
			 ifNil: [ #Private ]
			 ifNotNil: [ self nodeToString: aModuleProperty visibility ])
			asSymbol.
	fn isConstant: false.

	fn anchor: (self codeAnchor: fn name for: aModuleProperty).
	self state top addAttribute: fn.
	^ fn
]

{ #category : #'properties - variables' }
JinDAMFullASTCodeImporter >> visitModulePropertyGet: aModulePropertyGet [

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
				acc typeReference:
					(self typeName: aModulePropertyGet type context: acc).
				acc typeAnchor: self state top anchor / #accessors
					/ acc typeReference adaptToAlceAnchorPathFragment / #'@src'
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
	aModulePropertyGet block acceptVisitor: self.
	self state pop.
	^ acc
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitNegatedOperation: aVBNegatedOperationNode [

	| comp |
	comp := self instantiate: JinDAMUnaryOperation.
	comp setAsPrefix. 
	comp operator: #-.

	comp operand: (aVBNegatedOperationNode value acceptVisitor: self).
	^ comp
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitNewClause: aVBNewClauseNode [

	^ (self instantiate: JinDAMNewExpression)
		  typeReference: (aVBNewClauseNode typeName acceptVisitor: self);
		  yourself
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitNotOperation: aVBNotOperationNode [

	| not |
	not := self instantiate: JinDAMUnaryOperation.
	not operator: #Not.
	not setAsPrefix.
	not operand: (aVBNotOperationNode value acceptVisitor: self).
	^ not
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitNull: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitOnErrorGoTo: aStatement [

	| onError |
	onError := self instantiate: JinDAMOnError.
	onError do: (aStatement to acceptVisitor: self).
	^ onError
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitOnErrorResumeNext: aStatement [
	^ self instantiate: JinDAMOnErrorResumeNext 
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitOnExpressionGo: aStatement [
			self halt 
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitOpenClause: aVBOpenClauseNode [

	^ (self instantiate: JinDAMFileOpenClause)
		  filePathReference:
			  (aVBOpenClauseNode filepath acceptVisitor: self);
		  kind: aVBOpenClauseNode mode value;
		  fileDescriptorReference:
			  (aVBOpenClauseNode fileDescriptor acceptVisitor: self);
		  yourself
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitOptionBase: anOptionBase [
		self halt 
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitOptionCompareDatabase: aVBOptionCompareDatabaseNode [ 
	self state top compareDatabase: true 
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitOptionExplicit: aVBOptionExplicitNode [

	self state top optionExplicit: true
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitParameter: aParameter [

	| param |
	param := self instantiate: JinDAMParameter.
	param name: (self nodeToString: aParameter name).
	param typeReference:  (self typeName: aParameter type context: param).
	param isOptional: aParameter isOptional.
	param anchor: (self codeAnchor: param name for: aParameter ).
	self state top addParameter: param
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitParameterList: aVBParameterListNode [

	^ self visitProgram: aVBParameterListNode
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitParentheseesExpression: aVBParentheseesExpressionNode [

	^ (self instantiate: JinDAMParentesis)
		  expression:
			  (aVBParentheseesExpressionNode expression acceptVisitor: self);
		  yourself
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitPrintIntoFileClause: aVBPrintIntoFileClauseNode [

	^ (self instantiate: JinDAMFilePrintIntoClause)
		  fileDescriptorReference:
			  (aVBPrintIntoFileClauseNode fileNumber acceptVisitor: self);
		  printingReferences:
			  (aVBPrintIntoFileClauseNode values acceptVisitor: self);
		  yourself
]

{ #category : #invocations }
JinDAMFullASTCodeImporter >> visitProcedureCallOrArrayAccess: aProcedureCallOrArrayAccess [

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
				       anchor: (self
						        codeAnchor: 'expression'
						        for: aProcedureCallOrArrayAccess receiver);
				       candidate: ref;
				       candidateAnchor: ref anchor;
				       context: element;
				       yourself.
			element readReference: ref ].
	element anchor:
		(self codeAnchor: 'memberRead' for: aProcedureCallOrArrayAccess).
	element readReference isTypeReference ifTrue: [ 
		| typeReference |
		ref := self instantiate: JinDAMTypeMemberReference.
		typeReference := element readReference.
		typeReference context: element.
		ref context: typeReference.
		element readReference: ref ].

	" Element should be either an access or an invocation. both cases it may have arguments (either for invocation or array access). "

	" Can we visit the arguments? we may need to add them as arguments int o the element."
	self state push: element.

	aProcedureCallOrArrayAccess arguments acceptVisitor: self.
	self state pop.
	^ element
]

{ #category : #'type definition' }
JinDAMFullASTCodeImporter >> visitProgram: aNode [

	^ self visitCollection: aNode sortedChildren
]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitRaiseError: aRaiseError [
	^ self visitProgram: aRaiseError.

]

{ #category : #invocations }
JinDAMFullASTCodeImporter >> visitRaiseEvent: aRaiseEvent [

	aRaiseEvent selector acceptVisitor: self
]

{ #category : #'properties - variables' }
JinDAMFullASTCodeImporter >> visitReDimVariable: aReDimVariable [

	self state top localVariables
		detect: [ :a | a name = aReDimVariable variable name token value ]
		ifFound: [ :e | 
		e redim: (self nodeToString: aReDimVariable variable type) ]
		ifNone: [  ]
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitRename: aVBRenameNode [

	^ (self instantiate: JinDAMRenameFile)
		  oldNameReference: (aVBRenameNode oldName acceptVisitor: self);
		  newNameReference: (aVBRenameNode newName acceptVisitor: self);
		  yourself
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitResumeEmpty: aStatement [

	^ self instantiate: JinDAMResumeEmpty
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitResumeLabel: aResomeNext [

	^ (self instantiate: JinDAMResume)
		  destination: (aResomeNext destination acceptVisitor: self);
		  yourself
]

{ #category : #'avoiding visit' }
JinDAMFullASTCodeImporter >> visitResumeNext: aResomeNext [

	^ self instantiate: JinDAMResumeNext
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitReturn: aVBReturnNode [ 
	^ self instantiate: JinDAMReturnEmpty
]

{ #category : #enumerating }
JinDAMFullASTCodeImporter >> visitSelect: aVBSelectNode [
	^ (self instantiate: JinDAMSelect)
		  expression: (aVBSelectNode expression acceptVisitor: self);
		  cases: (self visitCollection: aVBSelectNode cases);
		  yourself
]

{ #category : #'member access' }
JinDAMFullASTCodeImporter >> visitSimpleIdentifier: aSimpleIdentifier [

	| read tip |
	({ 
		 JinDAMModule.
		 JinDAMAccessWrite.
		 JinDAMInvocable.
		 JinDAMArgument } anySatisfy: [ :a | self state top isKindOf: a ]) 
		ifTrue: [ 
			read := self instantiate: JinDAMAccessRead.
			tip := self
				       instantiateReferenceForNames: { { 
						       aSimpleIdentifier token value.
						       #member } }
				       context: read
				       preferring: { #isAttribute. #isInvocable. #isType }.
			read readReference: tip.
			read anchor: (self codeAnchor: 'memberRead' for: aSimpleIdentifier).
			self state top addAccess: read ].

	read ifNil: [ 
		({ 
			 JinDAMAttribute.
			 JinDAMConstant } anySatisfy: [ :a | self state top isKindOf: a ]) 
			ifFalse: [ self error: 'What is the symbol? ' ] ].

	^ read
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitSmaccToken: aSmaCCCaseInsensitiveToken [

	| read tip |
	({ 
		 JinDAMAccessWrite.
		 JinDAMInvocable.
		 JinDAMArgument } anySatisfy: [ :a | self state top isKindOf: a ]) 
		ifTrue: [ 
			read := self instantiate: JinDAMAccessRead.
			tip := self
				       instantiateReferenceForNames: { { 
						       aSmaCCCaseInsensitiveToken value.
						       #member } }
				       context: read
				       preferring: { #isAttribute. #isInvocable }.
			read readReference: tip.
			read anchor: (self codeAnchor: 'memberRead' for: aSmaCCCaseInsensitiveToken).
			self state top addAccess: read ].

	read ifNil: [ 
		({ 
			 JinDAMAttribute.
			 JinDAMConstant } anySatisfy: [ :a | self state top isKindOf: a ]) 
			ifFalse: [ self error: 'What is the symbol? ' ] ].

	^ read
]

{ #category : #'member access' }
JinDAMFullASTCodeImporter >> visitSquareBracketIdentifier: anIdentifier [

	^ self visitSimpleIdentifier: anIdentifier
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitStaticVariable: aVBStaticVariableNode [

	| var |
	var := aVBStaticVariableNode variable acceptVisitor: self.
	var isStatic: true.
	^ var
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitStringLiteral: aLiteral [

	^ self visitLiteral: aLiteral
]

{ #category : #'functions - subs - events' }
JinDAMFullASTCodeImporter >> visitSubDefinition: aDefinition [

	| fn |
	fn := self instantiate: JinDAMSubProcedure.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor:
		self state top anchor / #subprocedures / fn selector / #'@src'
		/ aDefinition startPosition asString / #to
		/ aDefinition stopPosition asString.
	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self.
	aDefinition block acceptVisitor: self.
	self state pop.
	^ fn
]

{ #category : #'type definition' }
JinDAMFullASTCodeImporter >> visitTypeOf: aTypeOf [

	| element tip |
	element := self instantiate: JinDAMAccessRead.
	tip := self
		       instantiateReferenceForNames: { 'TypeOf' }
		       context: element
		       preferring: { #isInvocable. #isAttribute. #isType }.

	element readReference: tip.
	element anchor: (self codeAnchor: 'typeOfRead' for: aTypeOf).
	self state top addAccess: element.

	" Element should be either an access or an invocation. both cases it may have arguments (either for invocation or array access). "

	" Can we visit the arguments? we may need to add them as arguments int o the element."
	self state push: element.

	aTypeOf argument acceptVisitor: self.
	aTypeOf type acceptVisitor: self.
	self state pop.
	^ element
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitUntilTrue: aVBUntilTrueNode [

	^ (self instantiate: JinDAMDoUntil)
		  condition: (aVBUntilTrueNode condition acceptVisitor: self);
		  block: (aVBUntilTrueNode body acceptVisitor: self)
]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitVariable: aVariable [

	| var |
	(self state top isKindOf: JinDAMInvocable) ifTrue: [ 
		var := self instantiateVariable: JinDAMLocalVariable from: aVariable.
		self state top addLocalVariable: var.
		^ var ].
	(self state top isKindOf: JinDAMModule) ifTrue: [ 
		var := self instantiateVariable: JinDAMAttribute from: aVariable.
		var visibility: #Public.
		self state top addAttribute: var.
		^ var ].
	self error: 'Unexpected case .'
]

{ #category : #generated }
JinDAMFullASTCodeImporter >> visitVariableList: aVariableList [
	^ self visitProgram: aVariableList.

]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitWhileTrue: aVBWhileTrueNode [

	^ (self instantiate: JinDAMWhile)
		  condition: (aVBWhileTrueNode condition acceptVisitor: self);
		  block: (aVBWhileTrueNode body acceptVisitor: self)
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitWhileWend: aVBWhileWendNode [

	^ (self instantiate: JinDAMWhile)
		  condition: (aVBWhileWendNode condition acceptVisitor: self);
		  block: (aVBWhileWendNode body acceptVisitor: self)
]

{ #category : #visiting }
JinDAMFullASTCodeImporter >> visitWith: aVBWithNode [

	^ (self instantiate: JinDAMWith)
		  with: (aVBWithNode with acceptVisitor: self);
		  block: (aVBWithNode block acceptVisitor: self);
		  yourself
]

{ #category : #assignments }
JinDAMFullASTCodeImporter >> writeStringSelector: anExplicitAssignement [

	^ (self nodeToString: anExplicitAssignement left) , '='
	  , (self nodeToString: anExplicitAssignement right)
]
